{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Dracula";
  src = pkgs.fetchFromGitHub {
    owner = "RAprogramm";
    repo = "HyDe-Themes";
    rev = "Dracula";
    name = name;
    sha256 = "sha256-AaFFKyFasjGQuLtqJeZYWxrtAgqsW0FDVxB8KqZkkzM=";
  };

  meta = {
    description = "HyDE Theme: Dracula";
    homepage = "https://github.com/RAprogramm/HyDe-Themes/tree/Dracula";
  };
}
