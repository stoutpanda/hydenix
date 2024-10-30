{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Ice Age";
  src = pkgs.fetchFromGitHub {
    owner = "saber-88";
    repo = "Ice-Age";
    rev = "main";
    name = name;
    sha256 = "sha256-cowqH9jn65/9hm5HaOEmdDLTVvqs/dOsP3UpDSIA2v0=";
  };

  meta = {
    description = "HyDE Theme: Ice Age";
    homepage = "https://github.com/saber-88/Ice-Age";
  };
}
