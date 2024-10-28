{ pkgs, userConfig, ... }:

let
  generateKickstartScript = pkgs.writeShellScriptBin "generate-kickstart" ''
    #!/bin/bash
    # Define variables from userConfig
    ROOT_PASSWORD="${userConfig.defaultPassword}"
    USERNAME="${userConfig.username}"
    USER_PASSWORD="${userConfig.defaultPassword}"
    DISK_SIZE=${toString userConfig.vm.diskSize}

    # Calculate partition sizes based on disk size
    ROOT_SIZE=$((DISK_SIZE * 70 / 100))  # 70% for root
    HOME_SIZE=$((DISK_SIZE * 20 / 100))  # 20% for home
    SWAP_SIZE=$((DISK_SIZE * 5 / 100))  # 5% for swap

    # Path to the original Kickstart template
    KICKSTART_TEMPLATE="${toString ./.}/scripts/preseed/fedora-kickstart.ks.template"

    # Use a temporary directory for the processed Kickstart file
    TEMP_DIR="/tmp/fedora-kickstart"
    mkdir -p $TEMP_DIR
    KICKSTART_PROCESSED="$TEMP_DIR/fedora-kickstart.ks"

    # Replace placeholders with actual values
    sudo sed -e "s/{{ root_password }}/$ROOT_PASSWORD/g" \
        -e "s/{{ username }}/$USERNAME/g" \
        -e "s/{{ user_password }}/$USER_PASSWORD/g" \
        -e "s/{{ root_size }}/$ROOT_SIZE/g" \
        -e "s/{{ home_size }}/$HOME_SIZE/g" \
        -e "s/{{ swap_size }}/$SWAP_SIZE/g" \
        $KICKSTART_TEMPLATE > $KICKSTART_PROCESSED
  '';

  fedoraVmHcl = pkgs.writeText "fedora-vm.pkr.hcl" ''
    packer {
      required_plugins {
        qemu = {
          version = ">= 1.0.0"
          source  = "github.com/hashicorp/qemu"
        }
      }
    }

    source "qemu" "fedora" {
      iso_url           = "https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/x86_64/iso/Fedora-Server-dvd-x86_64-40-1.14.iso"
      iso_checksum      = "32d9ab1798fc8106a0b06e873bdcd83a3efea8412c9401dfe4097347ed0cfc65"
      output_directory  = "output-fedora-vm"
      shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
      disk_size         = "${toString userConfig.vm.diskSize}"
      format            = "qcow2"
      accelerator       = "kvm"
      ssh_username      = "${userConfig.username}"
      ssh_password      = "${userConfig.defaultPassword}"
      ssh_timeout       = "20m"
      vm_name           = "fedora-vm"
      memory            = "${toString userConfig.vm.memorySize}"
      cpus              = "${toString userConfig.vm.cores}"
      headless          = false
      boot_command      = [
        "<wait3s><up><wait>",
        "e",
        "<down><down><down><left>",
        " inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-kickstart.ks<f10><wait>"
      ]
      http_directory    = "/tmp/fedora-kickstart"
      ssh_handshake_attempts = "20"
    }

    build {
      sources = ["source.qemu.fedora"]

      provisioner "shell" {
        inline = [
          "sudo dnf update -y",
          "sudo dnf install -y git vim",
          "echo 'Size of /root:' && sudo du -sh /root",
          "echo 'Size of /home:' && sudo du -sh /home"
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
          "mkdir -p /home/${userConfig.username}/hydenix/hydenix"
        ]
      }

      provisioner "file" {
        source      = "${toString ./.}/../../"
        destination = "/home/${userConfig.username}/hydenix"
      }

      provisioner "shell" {
        script = "${toString ./.}/scripts/install/fedora-setup.sh"
      }

      provisioner "shell" {
        inline = [
          "cd /home/${userConfig.username}/hydenix/hydenix",
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

  build-vm = pkgs.writeShellScriptBin "build-fedora-vm" ''
    # Generate the Kickstart file
    ${generateKickstartScript}/bin/generate-kickstart

    # Clean up existing output directory
    rm -rf output-fedora-vm

    # Stop and remove existing VM if it exists
    VM_NAME="fedora-vm"
    if sudo ${pkgs.libvirt}/bin/virsh list --all | grep -q "$VM_NAME"; then
      sudo ${pkgs.libvirt}/bin/virsh destroy "$VM_NAME" || true
      sudo ${pkgs.libvirt}/bin/virsh undefine "$VM_NAME" --remove-all-storage
    fi

    ${pkgs.packer}/bin/packer init ${fedoraVmHcl}
    ${pkgs.packer}/bin/packer build ${fedoraVmHcl}
  '';

  run-vm = pkgs.writeShellScriptBin "run-fedora-vm" ''
    VM_IMAGE="output-fedora-vm/fedora-vm"
    VM_NAME="fedora-vm"
    LIBVIRT_DEFAULT_URI="qemu:///system"

    # Check if VM image exists, if not, build it
    if [ ! -f "$VM_IMAGE" ]; then
      echo "VM image not found. Building it now..."
      ${build-vm}/bin/build-fedora-vm
      
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
      --os-variant fedora37 \
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
