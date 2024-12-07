{
  lib,
  pkgs,
  activeTheme,
  ...
}:

/*
  Home-Manager Activation Lifecycle:
  1. Activation script generation starts
  2. Home environment is built
  3. "specialisation" phase runs if configured
  4. "preActivation" hooks execute
  5. Main activation begins:
     - "onlyIfChanged" scripts run if config changed
     - "linkGeneration" creates symlinks
      ┌─────────────────────────────────────────────────────────────────┐
      │ mutableFileGeneration: Copies files with read/write permissions │
      │ instead of symlinking when mutable flag is set                  │
      │ hydenix custom, see: /hm/mutable/mutable.nix for implementation │
      └─────────────────────────────────────────────────────────────────┘
     - "writeBoundary" ensures writes complete
     - Regular activation scripts execute
  6. "postActivation" hooks run
  7. Activation completes

  Current Activation Scripts:
  - setupHydeFirefox: Installs Firefox theme/extensions after writes complete
  - makeStubMeta: Creates metadata file for hyde-cli after symlinks
  - hydeLink: Links hyde-cli to hyprdots installation
  - swwwallCache: Generates wallpaper cache for swww
  - setTheme: Sets the theme after wallpaper cache is generated
*/

let
  hyde-cli = import ../sources/hyde-cli.nix { inherit pkgs lib; };
in

{

  # TODO: i should be able to make this in the derivation of hyde-cli
  # TODO: if exists nothing i can do about it cause chattr
  # generates meta file for hyde-cli
  makeStubMeta = lib.hm.dag.entryAfter [ "mutableFileGeneration" ] ''
    mkdir -p $HOME/.cache/hyde
    rm -f $HOME/.cache/hyde/hyde.meta
    $DRY_RUN_CMD cat << EOF > $HOME/.cache/hyde/hyde.meta
    export CloneDir="$HOME/.local/state/nix/profiles/home-manager/home-path/share/hyde/hyprdots-modified"
    export current_branch="master"
    export git_url="https://github.com/prasanthrangan/hyprdots.git"
    export restore_cfg_hash=""
    export git_hash="204edc16847f8a67dd32a2b37c6139af88f5228a"
    export hyde_version="204edc16847f8a67dd32a2b37c6139af88f5228a"
    export modify_date=""
    export commit_message="Generated from Hydenix"
    EOF
  '';

  # links hyde-cli to hyprdots
  hydeLink = lib.hm.dag.entryAfter [ "makeStubMeta" ] ''
    export PATH="${lib.makeBinPath hyde-cli.buildInputs}:$PATH"
    $DRY_RUN_CMD ${hyde-cli}/bin/Hyde-install -l -d $HOME/.local/state/nix/profiles/home-manager/home-path/share/hyde/hyprdots-modified
  '';

  # TODO: this should be in the derivation of hyde-cli if possible
  # generates swww wallpaper cache
  swwwallCache = lib.hm.dag.entryAfter [ "hydeLink" ] ''
    set -e
    export PATH="${
      lib.makeBinPath [
        pkgs.imagemagick
        pkgs.parallel
      ]
    }:$PATH"
    $DRY_RUN_CMD $HOME/.local/share/bin/swwwallcache.sh -t "${activeTheme}"
  '';

  # sets the theme to the last theme in the themes list 
  # TODO: waybar borks, users have to run Hyde waybar reload
  setTheme = lib.hm.dag.entryAfter [ "swwwallCache" ] ''
    export PATH="${
      lib.makeBinPath [
        pkgs.swww
        pkgs.killall
        pkgs.hyprland
        pkgs.dunst
        pkgs.libnotify
        pkgs.systemd
        pkgs.waybar
        pkgs.kitty
      ]
    }:$PATH"

    $DRY_RUN_CMD $HOME/.local/share/bin/themeswitch.sh -s "${activeTheme}"
  '';
}
