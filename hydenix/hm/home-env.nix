{
  lib,
  pkgs,
}:

{
  # Wayland and general environment
  NIXOS_OZONE_WL = "1"; # Enable Ozone Wayland support for Electron-based apps
  MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland support for Mozilla Firefox
  # allows gsettings schemas to work
  XDG_DATA_DIRS = lib.mkForce "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:\${NIX_STATE_DIR:-/nix/var/nix}/profiles/default/share:/etc/profiles/per-user/hydenix/share:/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop\${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}";
}
