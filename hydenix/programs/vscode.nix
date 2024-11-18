{ pkgs, ... }:

let
  vscodeWallbash = pkgs.callPackage ../sources/vscode-wallbash.nix { };
in
{
  programs.vscode = {
    enable = true;
    extensions = [
      vscodeWallbash
    ];
  };
}
