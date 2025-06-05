{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
}:

let
  archImageUrl = "https://geo.mirror.pkgbuild.com/images/v20250415.336224/Arch-Linux-x86_64-basic-20250415.336224.qcow2";

  hydevmScript = pkgs.writeShellScriptBin "hydevm" ''
                                set -e
                                
                                # Configuration
                                CACHE_DIR="$(pwd)/.hyde-cache/hydevm"
                                BASE_IMAGE="$CACHE_DIR/archbase.qcow2"
                                SNAPSHOTS_DIR="$CACHE_DIR/snapshots"
                                HYDE_REPO="https://github.com/HyDE-Project/HyDE.git"
                                
                                # Create cache directories
                                mkdir -p "$CACHE_DIR" "$SNAPSHOTS_DIR"

                                function print_usage() {
                                  echo "HydeVM - Simplified VM tool for HyDE contributors"
                                  echo ""
                                  echo "Usage: hydevm [OPTIONS] [BRANCH/COMMIT]"
                                  echo ""
                                  echo "Arguments:"
                                  echo "  BRANCH/COMMIT            Git branch or commit hash (default: master)"
                                  echo ""
                                  echo "Options:"
                                  echo "  --persist               Make VM changes persistent"
                                  echo "  --list                  List available snapshots"
                                  echo "  --clean                 Clean all cached data"
                                  echo "  --help                  Show this help"
                                  echo ""
                                  echo "Environment Variables:"
                                  echo "  VM_MEMORY=8G            Set VM memory (default: 4G)"
                                  echo "  VM_CPUS=4               Set VM CPU count (default: 2)"
                                  echo ""
                                  echo "Examples:"
                                  echo "  hydevm                  # Run master branch (non-persistent)"
                                  echo "  hydevm --persist        # Run master branch (persistent)"
                                  echo "  hydevm feature-branch   # Run specific branch"
                                  echo "  hydevm abc123           # Run specific commit"
                                  echo "  hydevm --persist dev    # Run dev branch with persistence"
                                }

                                function download_archbox() {
                                  if [ ! -f "$BASE_IMAGE" ]; then
                                    echo "📦 Downloading Arch Linux base image..."
                                    ${pkgs.curl}/bin/curl -L "${archImageUrl}" -o "$BASE_IMAGE"
                                    echo "✅ Base image downloaded successfully"
                                  fi
                                }

                                function get_snapshot_name() {
                                  local ref="$1"
                                  if [ -z "$ref" ]; then
                                    echo "master"
                                  else
                                    # Sanitize branch/commit name for filename
                                    echo "$ref" | sed 's/[^a-zA-Z0-9._-]/_/g'
                                  fi
                                }

                                function create_hyde_snapshot() {
                                  local ref="''${1:-master}"
                                  local snapshot_name=$(get_snapshot_name "$ref")
                                  local snapshot_path="$SNAPSHOTS_DIR/hyde-$snapshot_name.qcow2"
                                  
                                  # Check if snapshot already exists
                                  if [ -f "$snapshot_path" ]; then
                                    echo "📸 Snapshot for '$ref' already exists"
                                    return 0
                                  fi
                                  
                                  echo "🔨 Creating HyDE snapshot for '$ref'..."
                                  
                                  # Create temporary VM image for setup
                                  local temp_image="$CACHE_DIR/temp-setup.qcow2"
                                  ${pkgs.qemu}/bin/qemu-img create -f qcow2 -F qcow2 -b "$BASE_IMAGE" "$temp_image"
                                  
                                  # Create setup script that will be available in the VM
                                  local setup_script="$CACHE_DIR/setup.sh"
                                  cat > "$setup_script" <<SETUP_EOF
        #!/bin/bash
        set -e

        echo "🚀 Setting up HyDE environment for branch/commit: $ref"

        # Set root password for convenience
        echo -e "hydevm\nhydevm" | sudo passwd root

        # Update system and install dependencies
        sudo pacman -Syu --noconfirm
        sudo pacman -S --needed --noconfirm git base-devel openssh curl

        # Configure SSH
        sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
        sudo systemctl enable sshd

        # Clone HyDE repository to arch user's home
        cd /home/arch
        git clone "https://github.com/HyDE-Project/HyDE.git" HyDE
        cd HyDE

        # Checkout specific branch/commit if provided
        if [ "$ref" != "master" ]; then
          git fetch origin
          if git show-ref --verify --quiet "refs/remotes/origin/$ref" 2>/dev/null; then
            echo "Checking out branch: $ref"
            git checkout -b "$ref" "origin/$ref"
          else
            echo "Checking out commit: $ref"
            git checkout "$ref"
          fi
        fi

        echo ""
        echo "🎨 HyDE repository cloned and ready!"
        echo "🚀 Starting HyDE installation..."
        cd /home/arch/HyDE/Scripts
        ./install.sh

        echo ""
        echo "✅ HyDE installation complete!"
        echo "💾 Please shutdown the VM now by running: sudo poweroff"
        echo "   This will create the snapshot for future use."
    SETUP_EOF

                                  chmod +x "$setup_script"
                                  
                                  echo ""
                                  echo "🖥️  Starting VM for HyDE installation..."
                                  echo "📋 SETUP INSTRUCTIONS:"
                                  echo "   1. Wait for the VM to boot to login prompt"
                                  echo "   2. Login as: arch / arch"
                                  echo "   3. Run: curl -s http://10.0.2.2:8000/setup.sh -o ./setup.sh"
                                  echo "   4. Run: chmod +x ./setup.sh"
                                  echo "   5. Run: ./setup.sh"
                                  echo "   6. Wait for installation to complete"
                                  echo "   7. Run: sudo poweroff"
                                  echo ""
                                  echo "Starting simple HTTP server for script delivery..."
                                  
                                  # Start simple HTTP server in background to serve the setup script
                                  cd "$CACHE_DIR"
                                  ${pkgs.python3}/bin/python3 -m http.server 8000 &
                                  local server_pid=$!
                                  
                                  # Start VM for setup
                                  ${pkgs.qemu}/bin/qemu-system-x86_64 \
                                    -m "''${VM_MEMORY:-8G}" \
                                    -smp "''${VM_CPUS:-4}" \
                                    -enable-kvm \
                                    -cpu host \
                                    -drive file="$temp_image",format=qcow2,if=virtio \
                                    -device virtio-vga-gl \
                                    -display gtk,gl=on,grab-on-hover=on \
                                    -device virtio-net,netdev=net0 \
                                    -netdev user,id=net0 \
                                    -boot menu=on
                                  
                                  # Kill the HTTP server
                                  kill $server_pid 2>/dev/null || true
                                  
                                  echo ""
                                  echo "💾 Converting VM to snapshot..."
                                  
                                  # Convert temporary image to final snapshot
                                  ${pkgs.qemu}/bin/qemu-img convert -O qcow2 "$temp_image" "$snapshot_path"
                                  
                                  # Cleanup
                                  rm -f "$temp_image" "$setup_script"
                                  
                                  echo "✅ Snapshot created: hyde-$snapshot_name"
                                  echo "🚀 You can now run: hydevm $ref"
                                }

                                function run_vm() {
                                  local ref="''${1:-master}"
                                  local persistent="''${2:-false}"
                                  local snapshot_name=$(get_snapshot_name "$ref")
                                  local snapshot_path="$SNAPSHOTS_DIR/hyde-$snapshot_name.qcow2"
                                  
                                  # Ensure snapshot exists
                                  if [ ! -f "$snapshot_path" ]; then
                                    echo "📸 Snapshot for '$ref' not found, creating it..."
                                    create_hyde_snapshot "$ref"
                                  fi
                                  
                                  local vm_disk
                                  if [ "$persistent" = "true" ]; then
                                    echo "🔒 Running in persistent mode - changes will be saved"
                                    vm_disk="$snapshot_path"
                                  else
                                    echo "🔄 Running in non-persistent mode - changes will be discarded"
                                    vm_disk="$(mktemp -p "$CACHE_DIR" overlay.XXXXXX.qcow2)"
                                    ${pkgs.qemu}/bin/qemu-img create -f qcow2 -F qcow2 -b "$snapshot_path" "$vm_disk"
                                    trap "rm -f '$vm_disk'" EXIT
                                  fi
                                  
                                  echo "🚀 Starting HyDE VM (branch/commit: $ref)..."
                                  echo "   Login: arch / arch"
                                  echo "   SSH: ssh arch@localhost -p 2222"
                                  
                                  ${pkgs.qemu}/bin/qemu-system-x86_64 \
                                    -m "''${VM_MEMORY:-4G}" \
                                    -smp "''${VM_CPUS:-2}" \
                                    -enable-kvm \
                                    -cpu host \
                                    -drive file="$vm_disk",format=qcow2,if=virtio \
                                    -device virtio-vga-gl \
                                    -display gtk,gl=on,grab-on-hover=on \
                                    -device virtio-net,netdev=net0 \
                                    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
                                    -boot menu=on \
                                    ''${VM_EXTRA_ARGS:-}
                                }

                                function list_snapshots() {
                                  echo "📸 Available HyDE snapshots:"
                                  if [ -d "$SNAPSHOTS_DIR" ]; then
                                    find "$SNAPSHOTS_DIR" -name "hyde-*.qcow2" -exec basename {} \; | \
                                      sed 's/^hyde-//' | sed 's/\.qcow2$//' | sort
                                  else
                                    echo "No snapshots found"
                                  fi
                                }

                                function clean_cache() {
                                  echo "🧹 Cleaning HydeVM cache..."
                                  rm -rf "$CACHE_DIR"
                                  echo "✅ Cache cleaned"
                                }

                                # Main logic
                                persistent="false"
                                ref="master"
                                
                                # Parse arguments
                                while [ $# -gt 0 ]; do
                                  case "$1" in
                                    --persist)
                                      persistent="true"
                                      shift
                                      ;;
                                    --list)
                                      list_snapshots
                                      exit 0
                                      ;;
                                    --clean)
                                      clean_cache
                                      exit 0
                                      ;;
                                    --help|-h)
                                      print_usage
                                      exit 0
                                      ;;
                                    -*)
                                      echo "❌ Unknown option: $1"
                                      print_usage
                                      exit 1
                                      ;;
                                    *)
                                      ref="$1"
                                      shift
                                      ;;
                                  esac
                                done

                                # Ensure archbox is available
                                download_archbox
                                
                                # Run VM
                                run_vm "$ref" "$persistent"
  '';
in
{
  defaultPackage = hydevmScript;

  mkHydeVM =
    {
      memory ? "4G",
      cpus ? 2,
      extraArgs ? "",
    }:
    pkgs.writeShellScriptBin "run-hydevm" ''
      VM_MEMORY="${memory}" VM_CPUS="${toString cpus}" VM_EXTRA_ARGS="${extraArgs}" ${hydevmScript}/bin/hydevm "$@"
    '';
}
