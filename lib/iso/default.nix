{
  commonArgs,
}:
let
  inherit (commonArgs)
    system
    inputs
    pkgs
    ;

  # Add the ISO image module
  isoImageModule = "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";

  # Create the base ISO configuration
  isoSystem = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      isoImageModule
      {
        # Enable nix experimental features
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];

        # Live USB settings
        isoImage.makeEfiBootable = true;
        isoImage.makeUsbBootable = true;

        # ISO-specific configuration
        isoImage.edition = pkgs.lib.mkForce "hydenix";
        isoImage.isoName = pkgs.lib.mkForce "hydenix-${inputs.nixpkgs.lib.version}.iso";

        # Add installation script and required packages to ISO
        environment.systemPackages = with pkgs; [
          (writeScriptBin "hydenix-install" (builtins.readFile ./nixos-install.sh))
          # Required by installation script
          fzf
          parted
          dosfstools # for mkfs.fat
          e2fsprogs # for mkfs.ext4
          util-linux # for wipefs, lsblk
          util-linux.bin
          git
          vim
          # Add WiFi support packages
          networkmanager # Includes nmcli
        ];

        # Enable NetworkManager
        networking.networkmanager.enable = true;
        networking.wireless.enable = false; # Disable wpa_supplicant as we're using NetworkManager

        # Copy installation script to home directory
        system.activationScripts.copyTemplate = ''
          mkdir -p /home/nixos
          cp -r ${../../template} /home/nixos/hydenix
          chmod -R u+w /home/nixos/hydenix
          chown -R nixos:nixos /home/nixos/hydenix
        '';

        # Display welcome message and instructions at boot
        services.getty.helpLine = ''
          Welcome to HydeNix! 💻

          WiFi Setup:
          - Use 'nmtui' for text-based network configuration
          - Or use 'nmcli' for command-line interface

          To start the installation:
          1. Log in as "root" (no password required)
          2. Run 'hydenix-install' to start the guided installation
          3. Follow the on-screen prompts

          For manual installation:
          1. cd hydenix
          2. Edit config.nix with your preferences
          3. Generate hardware config: nixos-generate-config --show-hardware-config > hardware-configuration.nix
          4. Initialize git: git init && git add .
          5. Install: nixos-install --flake .#<YOUR-HOSTNAME>
          6. Set root password when prompted
          7. Reboot: reboot

          Need help? Visit: https://github.com/richen604/hydenix
        '';

        i18n.supportedLocales = [ "all" ];
      }
    ];
  };
in
{
  # Updated ISO builder
  iso =
    pkgs.runCommand "hydenix-iso"
      {
        nativeBuildInputs = [ pkgs.coreutils ];
      }
      ''
        mkdir -p $out
        cp -r ${isoSystem.config.system.build.isoImage}/iso/* $out/
      '';

  burn-iso = pkgs.writeScriptBin "burn-iso" ''
    #!/usr/bin/env bash
    if [ $# -ne 2 ]; then
      echo "Usage: burn-iso <iso-file> <device>"
      echo "Example: burn-iso hydenix.iso /dev/sdb"
      echo -e "\nAvailable devices:"
      lsblk -d -o NAME,SIZE,TYPE,MOUNTPOINT
      exit 1
    fi

    ISO_FILE=$1
    DEVICE=$2

    if [ ! -f "$ISO_FILE" ]; then
      echo "Error: ISO file '$ISO_FILE' not found"
      exit 1
    fi

    echo "WARNING: This will ERASE ALL DATA on $DEVICE"
    echo "Device details:"
    lsblk "$DEVICE"
    read -p "Are you sure you want to continue? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Formatting device..."
      sudo wipefs -a "$DEVICE"
      
      echo "Writing ISO to device..."
      sudo dd bs=4M if="$ISO_FILE" of="$DEVICE" conv=fsync status=progress
      
      echo "Syncing..."
      sync
      
      echo "Done! You can now safely remove the device."
    fi
  '';
}
