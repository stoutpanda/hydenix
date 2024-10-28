{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "AbyssGreen";
  src = pkgs.fetchFromGitHub {
    owner = "Itz-Abhishek-Tiwari";
    repo = "AbyssGreen";
    rev = "main";
    sha256 = "sha256-cosU+0wJSaQspcjYEZA5dMoZARz+8vQM+49Vyf2JvA8=";
  };

  meta = {
    description = "HyDE Theme: AbyssGreen";
    homepage = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen";
  };
}
