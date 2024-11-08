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

      mkConfig = import ./lib/mkConfig.nix {
        inherit
          inputs
          pkgs
          system
          home-manager
          nix-index-database
          nixpkgs
          ;
      };

      defaultConfig = mkConfig (import ./config.nix);
    in
    {

      # Main config builder
      lib = {
        inherit mkConfig;
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

        # NixOS activation packages
        hydenix = defaultConfig.nixosConfiguration.config.system.build.toplevel;

        # Home activation packages - you probably don't want to use these
        hm = defaultConfig.homeConfigurations.${defaultConfig.username}.activationPackage;
        hm-generic = defaultConfig.homeConfigurations."${defaultConfig.username}-generic".activationPackage;

        # EXPERIMENTAL VM BUILDERS
        arch-vm = defaultConfig.arch-vm;
        fedora-vm = defaultConfig.fedora-vm;
      };

      devShells.${system}.default = import ./lib/dev-shell.nix { inherit pkgs; };
    };
}
