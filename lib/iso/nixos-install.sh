#!/usr/bin/env bash

set -euo pipefail

cat <<"EOF"
  _    _           _            _
 | |  | |         | |          (_)
 | |__| |_   _  __| | ___ _ __  ___  __
 |  __  | | | |/ _` |/ _ \ '_ \| \ \/ /
 | |  | | |_| | (_| |  __/ | | | |>  <
 |_|  |_|\__, |\__,_|\___|_| |_|_/_/\_\
          __/ |
         |___/       ❄️ Powered by Nix ❄️
EOF

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}Please run as root${NC}"
  exit 1
fi

# Calculate swap size based on RAM
get_swap_size() {
  local mem_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
  local mem_gb=$((mem_kb / 1024 / 1024))
  
  if [ $mem_gb -le 2 ]; then
    echo $((mem_gb * 2))
  elif [ $mem_gb -le 8 ]; then
    echo $mem_gb
  else
    echo 8
  fi
}

# Select installation drive
select_drive() {
  echo -e "${BLUE}Available drives:${NC}"
  lsblk -d -p -n -l -o NAME,SIZE,MODEL | grep -v "loop" | \
    fzf --header "Select installation drive" --height=10
}

# Detect boot mode
detect_boot_mode() {
  if [ -d "/sys/firmware/efi" ]; then
    echo "uefi"
  else
    echo -e "${RED}Warning: UEFI boot mode not detected. NixOS strongly recommends UEFI boot.${NC}"
    read -p "Continue with legacy BIOS boot anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      exit 1
    fi
    echo "bios"
  fi
}

# Main installation function
main() {
  # Select drive
  local selected_drive=$(select_drive | awk '{print $1}')
  echo -e "${GREEN}Selected drive: $selected_drive${NC}"

  # Confirm selection
  read -p "This will ERASE ALL DATA on $selected_drive. Continue? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi

  # Detect boot mode
  local boot_mode=$(detect_boot_mode)
  echo -e "${BLUE}Detected boot mode: $boot_mode${NC}"

  # Calculate sizes
  local swap_size=$(get_swap_size)
  echo -e "${BLUE}Calculated swap size: ${swap_size}GB${NC}"

  # Wipe existing signatures
  wipefs -a "$selected_drive"

  # Partition drive
  if [ "$boot_mode" = "uefi" ]; then
    # GPT/UEFI partitioning (preferred)
    parted "$selected_drive" -- mklabel gpt
    parted "$selected_drive" -- mkpart ESP fat32 1MiB 512MiB
    parted "$selected_drive" -- set 1 esp on
    parted "$selected_drive" -- mkpart primary 512MiB 100%
  else
    # MBR/BIOS partitioning (fallback)
    echo -e "${RED}Warning: Using legacy BIOS boot mode. Some NixOS features may not work correctly.${NC}"
    parted "$selected_drive" -- mklabel msdos
    parted "$selected_drive" -- mkpart primary 1MiB 512MiB
    parted "$selected_drive" -- set 1 boot on
    parted "$selected_drive" -- mkpart primary 512MiB 100%
  fi

  # Format partitions
  local boot_partition="${selected_drive}1"
  local root_partition="${selected_drive}2"

  mkfs.fat -F 32 -n NIXBOOT "$boot_partition"
  mkfs.ext4 -L NIXROOT "$root_partition"

  # Mount partitions
  mount /dev/disk/by-label/NIXROOT /mnt
  mkdir -p /mnt/boot
  mount /dev/disk/by-label/NIXBOOT /mnt/boot

  # Create and enable swap file
  dd if=/dev/zero of=/mnt/.swapfile bs=1G count=$swap_size status=progress
  chmod 600 /mnt/.swapfile
  mkswap /mnt/.swapfile
  swapon /mnt/.swapfile

  # Generate NixOS config
  nixos-generate-config --root /mnt

  echo -e "${GREEN}Basic system configuration complete!${NC}"
  echo -e "${BLUE}Next steps:${NC}"
  echo "1. Edit /mnt/etc/nixos/configuration.nix"
  echo "2. Run nixos-install"
  echo "3. Set root password"
  echo "4. Reboot"
}

main "$@"