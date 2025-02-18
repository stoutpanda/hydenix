final: prev:
let
  # Import the hyde commit from hyde/default.nix
  commit = "e0e90ea3830b8c222f13a969fe5e0c4688953448";

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
    hyde = {
      hyde = callPackage ./hyde/hyde.nix { inherit commit; };

      # Hyde themes and assets
      hyde-fonts = callPackage ./hyde/hyde-fonts.nix { inherit commit; };

      # hyde-firefox = callPackage ./hyde/hyde-firefox.nix { inherit commit; };

      wallbash-gtk = callPackage ./hyde/wallbash-gtk.nix { inherit commit; };
      wallbash-icons = callPackage ./hyde/icons-wallbash.nix { inherit commit; };

      # SDDM themes
      sddm-candy = callPackage ./hyde/sddm-candy.nix { inherit commit; };
      sddm-corners = callPackage ./hyde/sddm-corners.nix { inherit commit; };

      # GRUB themes
      grub-pochita = callPackage ./hyde/grub-pochita.nix { inherit commit; };
      grub-retroboot = callPackage ./hyde/grub-retroboot.nix { inherit commit; };

      # VSCode extensions
      vscode-wallbash = callPackage ./hyde/code-wallbash.nix { inherit commit; };

      # Spicetify themes
      spicetify-sleek = callPackage ./hyde/spicetify-sleek.nix { inherit commit; };

      # Theme packages from the themes directory
      themes = callPackage ./themes/default.nix { };
    };
  };
in
packages
