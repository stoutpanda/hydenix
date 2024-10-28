{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
  lib = pkgs.lib;
in
utils.mkTheme {
  name = "Catppuccin Mocha";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Catppuccin-Mocha";
    sha256 = "sha256-YbT1Rm49igI3H1wH21V5f+npjgbj0ya0Dfh9tM62nVI=";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Mocha";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha";
  };
}
