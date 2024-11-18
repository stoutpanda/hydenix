{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Bad Blood";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    name = name;
    rev = "162a40d67b07c7f7f63ac4262e2d007c21919aca";
    sha256 = "sha256-VKq++NlPM5a2XqzlfMMUMgHSLLqfLgtsDSalKNrUMqg=";
  };

  arcs = {
    gtk = "Bad-Blood";
    icon = "besgnulinux-mono-red";
    cursor = "Night-Diamond-Red";
  };

  meta = {
    description = "HyDE Theme: Bad Blood";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Bad-Blood";
  };
}
