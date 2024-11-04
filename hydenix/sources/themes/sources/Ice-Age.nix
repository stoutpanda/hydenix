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
    sha256 = "sha256-44l7UTHrCvvJL3TO6hk/SV2fxB9MXJtmSM5S56w8xVQ=";
  };

  meta = {
    description = "HyDE Theme: Ice Age";
    homepage = "https://github.com/saber-88/Ice-Age";
  };
}
