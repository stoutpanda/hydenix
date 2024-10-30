{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Material Sakura";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Material-Sakura";
    name = name;
    sha256 = "sha256-3tM422nWdWPEm7KY7Wh7fQ2KbzzZhBM6Zj8/z1aTVVo=";
  };

  meta = {
    description = "HyDE Theme: Material Sakura";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Material-Sakura";
  };
}
