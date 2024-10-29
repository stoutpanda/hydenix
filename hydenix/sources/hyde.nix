{ pkgs, ... }:

let
  # https://github.com/prasanthrangan/hyprdots/commit/2a0abfd56ce951e75213a1a91e2743a859304713
  hyprdotsRepo = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyprdots";
    rev = "2a0abfd56ce951e75213a1a91e2743a859304713";
    sha256 = "sha256-lSMO2V4eydXQPXJ4NbcciymC2sto3t/Wn/FLBd9mXo0=";
  };

  pkg = pkgs.stdenv.mkDerivation rec {
    name = "hyprdots-modified";
    src = hyprdotsRepo;

    buildPhase = ''
       # ensure all hyprdots scripts are executable in all shells
       find . -type f -executable -print0 | xargs -0 -I {} sed -i '1s|^#!.*|#!/usr/bin/env bash|' {}

       # Update waybar killall command in all hyprdots files
       find . -type f -print0 | xargs -0 sed -i 's/killall waybar/killall .waybar-wrapped/g'

       # update dunst
       find . -type f -print0 | xargs -0 sed -i 's/killall dunst/killall .dunst-wrapped/g'

       # update kitty
       find . -type f -print0 | xargs -0 sed -i 's/killall kitty/killall .kitty-wrapped/g'

       # TODO: test polkit as the commands hyde runs using it on themes are not working
       # TODO: when that is done we can revise scripts to use home-manager path its in nix-profile somewhere
       # # Add polkit authentication agent to hyprland config
       # sed -i '/^exec-once = /a exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1' ./Configs/.config/hypr/hyprland.conf

       find . -type f -executable -print0 | xargs -0 sed -i 's/find "/find -L "/g'
       find . -type f -name "*.sh" -print0 | xargs -0 sed -i 's/find "/find -L "/g'

      # scripts need to use dconf instead of gsettings
       find . -type f -not -name 'themepatcher.sh' -exec sed -i \
         -e 's/gsettings set/dconf write/g' \
         -e 's/gsettings get/dconf read/g' \
         -e 's/org\.gnome\.desktop\.interface \([^ ]*\)/\/org\/gnome\/desktop\/interface\/\1/g' \
         -e 's/org\.gnome\.desktop\.gtk \([^ ]*\)/\/org\/gnome\/desktop\/gtk\/\1/g' \
         -e 's/\(dconf write.*font-name\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*cursor-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*color-scheme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*gtk-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*icon-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*[^ ]*\) '"'"'\(\$[A-Za-z_][A-Za-z0-9_]*\)'"'"'/\1 "\2"/g' \
         -e 's/\(dconf write.*[^ ]*\) \(\$[A-Za-z_][A-Za-z0-9_]*\)/\1 "\2"/g' \
         {} +

         # add home-manager case to scripts
         find . -type f \( -name "*.sh" -o -executable \) -exec sed -i '/^if \[ -d \/run\/current-system\/sw\/share\/themes/,/else/c\if [ -d /run/current-system/sw/share/themes ] ; then\n    themeDir=/run/current-system/sw/share/themes\nelif [ -d ~/.local/state/nix/profiles/home-manager/home-path/share/themes ] ; then\n    themeDir=~/.local/state/nix/profiles/home-manager/home-path/share/themes\nelse' {} \;
    '';

    passthru = {
      inherit src;
    };

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
in
pkg
