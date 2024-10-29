{ pkgs, userConfig, ... }:

let
  archVmHcl = pkgs.writeText "arch-vm.pkr.hcl" ''
    packer {
      required_plugins {
        qemu = {
          version = ">= 1.0.0"
          source  = "github.com/hashicorp/qemu"
        }
      }
    }

    source "qemu" "arch" {
      iso_url           = "https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso"
      iso_checksum      = "file:https://geo.mirror.pkgbuild.com/iso/latest/sha256sums.txt"
      output_directory  = "output-arch-vm"
      shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
      disk_size         = "${toString userConfig.vm.diskSize}"
      format            = "qcow2"
      accelerator       = "kvm"
      ssh_username      = "${userConfig.username}"
      ssh_password      = "${userConfig.defaultPassword}"
      ssh_timeout       = "20m"
      vm_name           = "arch-vm"
      memory            = "${toString userConfig.vm.memorySize}"
      cpus              = "${toString userConfig.vm.cores}"
      headless          = false
      boot_wait         = "8s"
      boot_command      = [
        "<enter><wait15><wait15>",
        "/usr/bin/curl -O http://{{ .HTTPIP }}:{{ .HTTPPort }}/arch-preseed.sh<enter><wait5>",
        "/usr/bin/bash arch-preseed.sh<enter>"
      ]
      http_directory    = "${toString ./.}/scripts/preseed"
      ssh_handshake_attempts = "20"
    }

    build {
      sources = ["source.qemu.arch"]

      provisioner "shell" {
        inline = [
          "sudo pacman -Syu --noconfirm",
          "sudo pacman -S --noconfirm base-devel git vim",
        ]
      }

      provisioner "shell" {
        script = "${toString ./.}/scripts/install-nix.sh"
      }

      provisioner "shell" {
        script = "${toString ./.}/scripts/gen-config.sh"
      }

      provisioner "shell" {
        inline = [
          "mkdir -p /home/${userConfig.username}/hydenix"
        ]
      }

      provisioner "file" {
        source      = "${toString ./.}/../../"
        destination = "/home/${userConfig.username}/hydenix"
      }

      provisioner "shell" {
        script = "${toString ./.}/scripts/install/arch-setup.sh"
      }

      provisioner "shell" {
        inline = [
          "cd /home/${userConfig.username}/hydenix",
          ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh",
          "nix run home-manager/master -- switch --flake .",
          "nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update",
          "nix-env -iA nixgl.auto.nixGLDefault",
        ]
      }

    }
  '';
in
rec {
  build-vm = pkgs.writeShellScriptBin "build-arch-vm" ''
    # Clean up existing output directory
    rm -rf output-arch-vm

    # Stop and remove existing VM if it exists
    VM_NAME="arch-vm"
    if sudo ${pkgs.libvirt}/bin/virsh list --all | grep -q "$VM_NAME"; then
      sudo ${pkgs.libvirt}/bin/virsh destroy "$VM_NAME" || true
      sudo ${pkgs.libvirt}/bin/virsh undefine "$VM_NAME" --remove-all-storage
    fi

    ${pkgs.packer}/bin/packer init ${archVmHcl}
    ${pkgs.packer}/bin/packer build ${archVmHcl}
  '';

  run-vm = pkgs.writeShellScriptBin "run-arch-vm" ''
    VM_IMAGE="output-arch-vm/arch-vm"
    VM_NAME="arch-vm"
    LIBVIRT_DEFAULT_URI="qemu:///system"

    # Check if VM image exists, if not, build it
    if [ ! -f "$VM_IMAGE" ]; then
      echo "VM image not found. Building it now..."
      ${build-vm}/bin/build-arch-vm
      
      # Check if build was successful
      if [ ! -f "$VM_IMAGE" ]; then
        echo "Failed to build VM image. Exiting."
        exit 1
      fi
    fi

    # Function to create the default network if it doesn't exist
    create_default_network() {
      if ! sudo ${pkgs.libvirt}/bin/virsh net-list --all | grep -q "default"; then
        sudo ${pkgs.libvirt}/bin/virsh net-define /dev/stdin <<EOF
    <network>
      <name>default</name>
      <forward mode='nat'/>
      <bridge name='virbr0' stp='on' delay='0'/>
      <ip address='192.168.122.1' netmask='255.255.255.0'>
        <dhcp>
          <range start='192.168.122.2' end='192.168.122.254'/>
        </dhcp>
      </ip>
    </network>
    EOF
        sudo ${pkgs.libvirt}/bin/virsh net-start default
        sudo ${pkgs.libvirt}/bin/virsh net-autostart default
      fi
    }

    # Create the default network if it doesn't exist
    create_default_network

    # Remove existing VM if it exists
    if sudo ${pkgs.libvirt}/bin/virsh list --all | grep -q "$VM_NAME"; then
      sudo ${pkgs.libvirt}/bin/virsh destroy "$VM_NAME" || true
      sudo ${pkgs.libvirt}/bin/virsh undefine "$VM_NAME"
    fi

    # Create a new VM using virt-install
    sudo ${pkgs.virt-manager}/bin/virt-install \
      --connect qemu:///system \
      --name "$VM_NAME" \
      --memory ${toString userConfig.vm.memorySize} \
      --vcpus ${toString userConfig.vm.cores} \
      --disk path=$VM_IMAGE,format=qcow2 \
      --import \
      --os-variant archlinux \
      --network network=default \
      --graphics spice,gl.enable=yes,listen=none,rendernode=/dev/dri/renderD128 \
      --video virtio \
      --noautoconsole

    # Start the VM
    sudo ${pkgs.libvirt}/bin/virsh --connect qemu:///system start "$VM_NAME"

    echo "To connect to the VM, use: virt-viewer --connect qemu:///system --attach $VM_NAME"
    echo "Default login: username '${userConfig.username}', password '${userConfig.defaultPassword}'"

    # Wait for a moment to ensure the VM is fully started
    sleep 5

    # Open virt-viewer with proper permissions
    if [ "$DISPLAY" != "" ]; then
      ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:$(id -un)
      sudo -E ${pkgs.virt-viewer}/bin/virt-viewer --connect qemu:///system --attach "$VM_NAME"
    else
      echo "No display detected. Unable to open virt-viewer automatically."
      echo "You can try running 'virt-viewer --connect qemu:///system --attach $VM_NAME' manually when X is available."
    fi
  '';
}
