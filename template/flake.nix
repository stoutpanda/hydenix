{
  description = "template for hydenix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:richen604/hydenix/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      hydenix,
      ...
    }:
    let
      system = "x86_64-linux";

      hydenixConfig = hydenix.lib.mkConfig (import ./config.nix);
    in
    {

      # Main config builder
      lib = {
        inherit hydenixConfig;
      };

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
