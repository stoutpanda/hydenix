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
      self,
      nixpkgs,
      home-manager,
      nix-index-database,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkConfig = userConfig: rec {
        commonArgs = {
          inherit
            nixpkgs
            pkgs
            home-manager
            system
            userConfig
            nix-index-database
            ;
        };

        nixosConfiguration = import ./hosts/nixos { inherit commonArgs; };
        nix-vm = import ./hosts/vm/nix-vm.nix { inherit userConfig nixosConfiguration; };
        arch-vm = import ./hosts/vm/arch-vm.nix { inherit pkgs userConfig; };
        fedora-vm = import ./hosts/vm/fedora-vm.nix { inherit pkgs userConfig; };

        # import for customized home-manager configurations
        homeManagerModules.default = {
          ${userConfig.username} = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./hosts/nixos/home.nix
              nix-index-database.hmModules.nix-index
            ];
            extraSpecialArgs = {
              inherit userConfig;
              inherit inputs;
            };
          };
        };

        # only to be used on non-NixOS systems
        homeConfigurations = {
          "${userConfig.username}" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./hosts/nixos/home.nix
              nix-index-database.hmModules.nix-index
              {
                targets.genericLinux.enable = true;
              }
            ];
            extraSpecialArgs = {
              inherit userConfig;
              inherit inputs;
            };
          };
          activationPackage = self.homeConfigurations.${userConfig.username}.activationPackage;
        };

      };

      devShell = import ./lib/dev-shell.nix { inherit pkgs; };

      defaultConfig = mkConfig (import ./config.nix);
    in
    {
      lib = {
        inherit mkConfig;
      };

      nixosConfigurations = {
        hydenix = defaultConfig.nixosConfiguration.config.system.build.toplevel;
        nix-vm = defaultConfig.nix-vm.config.system.build.vm;
      };

      packages.${system} = {
        default = self.nixosConfigurations.nix-vm;
        gen-config = pkgs.writeShellScript "gen-config" (builtins.readFile ./lib/gen-config.sh);

        nix-vm = self.nixosConfigurations.nix-vm;
        # EXPERIMENTAL VM BUILDERS
        arch-vm = defaultConfig.arch-vm;
        fedora-vm = defaultConfig.fedora-vm;
      };

      homeConfigurations = defaultConfig.homeConfigurations;
      homeManagerModules = defaultConfig.homeManagerModules;

      devShells.${system}.default = devShell;
    };
}
