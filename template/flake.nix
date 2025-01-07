{
  description = "template for hydenix";

  inputs = {
    # User's nixpkgs - for user packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Hydenix and its nixpkgs - kept separate to avoid conflicts
    hydenix = {
      # Available inputs:
      # Main: github:richen604/hydenix
      # Dev: github:richen604/hydenix/dev 
      # Commit: github:richen604/hydenix/<commit-hash>
      # Version: github:richen604/hydenix/v1.0.0
      url = "github:richen604/hydenix";
    };
  };

  outputs =
    { ... }@inputs:
    let
      system = "x86_64-linux";

      # User's pkgs instance
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      hydenixConfig = inputs.hydenix.lib.mkConfig {
        userConfig = import ./config.nix;
        extraInputs = inputs;
        # Pass user's pkgs to be used alongside hydenix's pkgs (eg. userPkgs.kitty)
        extraPkgs = pkgs;
      };
    in
    {
      nixosConfigurations.${hydenixConfig.userConfig.host} = hydenixConfig.nixosConfiguration;

      packages.${system} = {
        # Packages below load your config in ./config.nix

        # defaults to nix-vm - nix run .
        default = hydenixConfig.nix-vm.config.system.build.vm;

        # NixOS build packages - nix run .#hydenix / sudo nixos-rebuild switch/test --flake .#hydenix
        hydenix = hydenixConfig.nixosConfiguration.config.system.build.toplevel;

        # Home activation packages - nix run .#hm / nix run .#hm-generic / home-manager switch/test --flake .#hm or .#hm-generic
        hm = hydenixConfig.homeConfigurations.${hydenixConfig.username}.activationPackage;
        hm-generic = hydenixConfig.homeConfigurations."${hydenixConfig.username}-generic".activationPackage;

        # EXPERIMENTAL VM BUILDERS - nix run .#arch-vm / nix run .#fedora-vm
        arch-vm = hydenixConfig.arch-vm;
        fedora-vm = hydenixConfig.fedora-vm;
      };
    };
}
