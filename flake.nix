{
  description = "Nix & home-manager configuration for HyDE, an Arch Linux based Hyprland desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkConfig = import ./lib/mkConfig.nix {
        inherit
          inputs
          pkgs
          system
          ;
      };

      defaultConfig = mkConfig {
        userConfig = import ./config.nix;
        extraInputs = { };
      };
    in
    {

      # Main config builder
      lib = {
        inherit mkConfig;
      };

      templates = {
        default = {
          path = ./template;
          description = "Hydenix template";
          welcomeText = ''
            ```
             _    _           _            _
            | |  | |         | |          (_)
            | |__| |_   _  __| | ___ _ __  ___  __
            |  __  | | | |/ _` |/ _ \ '_ \| \ \/ /
            | |  | | |_| | (_| |  __/ | | | |>  <
            |_|  |_|\__, |\__,_|\___|_| |_|_/_/\_\
                    __/ |
                    |___/       ❄️ Powered by Nix ❄️
            ```
            1. edit `config.nix` with your preferences
            2. run `sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix`
            3. `git init && git add .` (flakes have to be managed via git)
            4. run any of the packages in your new `flake.nix`
              - for vm `nix run .`
              - for rebuild `sudo nixos-rebuild switch/test/boot --flake .`
          '';
        };
      };

      packages.${system} = {
        # generate-config script
        gen-config = pkgs.writeShellScriptBin "gen-config" (builtins.readFile ./lib/gen-config.sh);

        /*
          Packages below are default configurations
          These are used for testing
        */

        # defaults to nix-vm
        default = defaultConfig.nix-vm.config.system.build.vm;

        # Home activation packages - you probably don't want to use these
        hm = defaultConfig.homeConfigurations.${defaultConfig.userConfig.username}.activationPackage;
        hm-generic =
          defaultConfig.homeConfigurations."${defaultConfig.userConfig.username}-generic".activationPackage;

        # EXPERIMENTAL VM BUILDERS
        arch-vm = defaultConfig.arch-vm.default;
        fedora-vm = defaultConfig.fedora-vm.default;
      };

      devShells.${system}.default = import ./lib/dev-shell.nix { inherit pkgs; };
    };
}
