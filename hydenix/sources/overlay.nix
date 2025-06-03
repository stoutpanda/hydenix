final: prev:
let
  # Helper function to import a package
  callPackage = prev.lib.callPackageWith (prev // packages);

  # Define all packages
  packages = {
    # Hyde core packages
    hyde-cli = callPackage ./hyde-cli.nix { };
    hyde-gallery = callPackage ./hyde-gallery.nix { };
    hyprdots = callPackage ./hyprdots.nix { };
    # Additional packages
    pokego = callPackage ./pokego.nix { };
    pokemon-colorscripts = callPackage ./pokemon-colorscripts.nix { };
    python-pyamdgpuinfo = callPackage ./python-pyamdgpuinfo.nix { };
    Tela-circle-dracula = callPackage ./Tela-circle-dracula.nix { };
    Bibata-Modern-Ice = callPackage ./Bibata-Modern-Ice.nix { };
    hydenix = {
      hyde = callPackage ./hyde/hyde.nix { };

      wallbash-gtk = callPackage ./hyde/wallbash-gtk.nix { };

      # SDDM themes
      sddm-candy = callPackage ./hyde/sddm-candy.nix { };
      sddm-corners = callPackage ./hyde/sddm-corners.nix { };

      # Spicetify themes
      spicetify-sleek = callPackage ./hyde/spicetify-sleek.nix { };

      # Theme packages from the themes directory
      themes = callPackage ./themes/default.nix { };
    };
  };
in
packages
