{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Dracula";
  src = pkgs.fetchFromGitHub {
    owner = "RAprogramm";
    repo = "HyDe-Themes";
    rev = "Dracula";
    sha256 = "sha256-AaFFKyFasjGQuLtqJeZYWxrtAgqsW0FDVxB8KqZkkzM=";
  };

  meta = {
    description = "HyDE Theme: Dracula";
    homepage = "https://github.com/RAprogramm/HyDe-Themes/tree/Dracula";
  };
}
