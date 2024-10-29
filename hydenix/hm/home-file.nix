{
  lib,
  pkgs,
  themes,
}:
let
  hyde-cli = import ../sources/hyde-cli.nix { inherit pkgs lib; };
  hyde = import ../sources/hyde.nix { inherit pkgs; };
  wallbash-gtk = import ../sources/wallbash-gtk.nix { inherit pkgs lib; };
  spicetify-sleek = import ../sources/spicetify-sleek.nix { inherit pkgs lib; };
  hyde-gallery = import ../sources/hyde-gallery.nix { inherit pkgs lib; };
in

lib.mkMerge [

  # TODO: cleanup home file calls for performance

  # --------------------------------------------------- // Hyde-cli
  {
    ".local/Hyde-cli" = {
      source = hyde-cli.src;
      recursive = true;
      mutable = true;
      force = true;
    };
  }

  # --------------------------------------------------- // Hyde configurations
  {
    ".config" = {
      source = "${hyde}/Configs/.config";
      force = true;
      recursive = true;
      mutable = true;
    };
    ".local/share" = {
      source = "${hyde}/Configs/.local/share";
      force = true;
      recursive = true;
      mutable = true;
    };
    ".icons/default" = {
      source = "${hyde}/Configs/.icons/default";
      force = true;
      recursive = true;
      mutable = true;
    };
    ".p10k.zsh" = {
      source = "${hyde}/Configs/.p10k.zsh";
      force = true;
      mutable = true;
    };
    ".gtkrc-2.0" = {
      source = "${hyde}/Configs/.gtkrc-2.0";
      force = true;
      mutable = true;
    };
    ".local/hyprdots" = {
      source = hyde;
      force = true;
      recursive = true;
      mutable = true;
    };
  }

  # --------------------------------------------------- // Theming
  {
    # Wallbash GTK theme
    ".themes/Wallbash-Gtk" = {
      source = "${wallbash-gtk}";
      force = true;
      recursive = true;
      mutable = true;
    };
    # Spicetify Sleek theme
    ".config/spicetify/Themes/Sleek" = {
      source = "${spicetify-sleek}";
      force = true;
      recursive = true;
      mutable = true;
    };
  }

  # --------------------------------------------------- // Cache files
  {
    # VSCode Wallbash extension
    ".cache/hyde/landing/Code_Wallbash.vsix" = {
      source = "${hyde}/Source/arcs/Code_Wallbash.vsix";
      force = true;
      mutable = true;
    };
    # Spotify Sleek theme (TODO: requires flatpak for Spotify)
    ".cache/hyde/landing/Spotify_Sleek.tar.gz" = {
      source = "${hyde}/Source/arcs/Spotify_Sleek.tar.gz";
      force = true;
      mutable = true;
    };
    # Hyde Gallery
    ".cache/hyde/landing/hyde-gallery" = {
      source = "${hyde-gallery}/hyde-gallery";
      force = true;
      recursive = true;
      mutable = true;
    };
  }

  # --------------------------------------------------- // Theme generation
  (import ./gen-theme-homefiles.nix { inherit lib pkgs; } themes)

]
