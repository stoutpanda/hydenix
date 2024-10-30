{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Edge Runner";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Edge-Runner";
    name = name;
    sha256 = "sha256-c5BKdcZw5Yd+bxwpc+PDtKrtZwNGkRlU1R/Y0APq/iA=";
  };

  meta = {
    description = "HyDE Theme: Edge Runner";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Edge-Runner";
  };
}
