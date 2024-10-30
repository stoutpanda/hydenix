{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Catppuccin Mocha";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Catppuccin-Mocha";
    name = name;
    sha256 = "sha256-YbT1Rm49igI3H1wH21V5f+npjgbj0ya0Dfh9tM62nVI=";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Mocha";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha";
  };
}
