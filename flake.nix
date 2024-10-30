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

      mkNixosHost = import ./hosts/nixos;
      nixVM = import ./hosts/vm/nixVM.nix;
      userConfig = import ./config.nix;

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
      archVMConfig = import ./hosts/vm/arch-vm.nix;
      fedoraVMConfig = import ./hosts/vm/fedora-vm.nix;
    in
    {
      nixosConfigurations = {
        hydenix = mkNixosHost commonArgs;

        hydenix-vm = nixVM {
          inherit userConfig;
          nixosSystem = mkNixosHost commonArgs;
        };
      };

      packages.${system} = {
        default = self.nixosConfigurations.hydenix-vm.config.system.build.vm;
        hydenix-vm = self.nixosConfigurations.hydenix-vm.config.system.build.vm;
        hydenix = self.nixosConfigurations.hydenix.config.system.build.toplevel;
        gen-config = pkgs.writeShellScriptBin "gen-config" (builtins.readFile ./scripts/gen-config.sh);

        # EXPERIMENTAL VM BUILDERS
        build-arch-vm =
          (archVMConfig {
            inherit pkgs userConfig;
          }).build-vm;
        run-arch-vm =
          (archVMConfig {
            inherit pkgs userConfig;
          }).run-vm;

        build-fedora-vm =
          (fedoraVMConfig {
            inherit pkgs userConfig;
          }).build-vm;
        run-fedora-vm =
          (fedoraVMConfig {
            inherit pkgs userConfig;
          }).run-vm;
      };

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
}
