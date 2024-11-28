{
  inputs,
  pkgs,
  system,
  ...
}:
{
  userConfig,
  extraInputs ? { },
}:
rec {
  commonArgs = {
    inherit pkgs system userConfig;
    inputs = inputs // extraInputs;
  };

  nixosConfiguration = import ../hosts/nixos { inherit commonArgs; };

  # Add ISO configuration
  installer = import ./iso { inherit commonArgs; };

  # TODO: wrap all vms in nixGL. openGL issues haha
  nix-vm = import ../hosts/vm/nix-vm.nix { inherit userConfig nixosConfiguration; };
  arch-vm = import ../hosts/vm/arch-vm.nix { inherit pkgs userConfig; };
  fedora-vm = import ../hosts/vm/fedora-vm.nix { inherit pkgs userConfig; };

  inherit userConfig;

  homeConfigurations = {

    # Home configuration for nix
    "${userConfig.username}" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ../hosts/nixos/home.nix
        inputs.nix-index-database.hmModules.nix-index
      ] ++ userConfig.homeModules;
      extraSpecialArgs = {
        inherit userConfig;
        inherit inputs;
      };
    };

    # Generic home configuration for non-NixOS systems
    "${userConfig.username}-generic" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ../hosts/nixos/home.nix
        inputs.nix-index-database.hmModules.nix-index
        {
          targets.genericLinux.enable = true;
        }
      ] ++ userConfig.homeModules;
      extraSpecialArgs = {
        inherit userConfig;
        inherit inputs;
      };
    };

  };
}
