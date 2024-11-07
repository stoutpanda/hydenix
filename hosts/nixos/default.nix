{
  commonArgs,
}:
let
  inherit (commonArgs)
    system
    userConfig
    home-manager
    nix-index-database
    nixpkgs
    ;
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = commonArgs;
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${userConfig.username} =
        { ... }:
        {
          imports = [
            ./home.nix
            nix-index-database.hmModules.nix-index
          ];
        };
      home-manager.extraSpecialArgs = {
        inherit userConfig;
      };
    }
  ];
}
