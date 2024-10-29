{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
  lib = pkgs.lib;
in

utils.mkTheme {
  name = "Mac OS";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    rev = "1701be171600db27b04f8bf704dc37efe36cd282";
    sha256 = "sha256-J8H+obYoePdAwkOA9NLwbrz1ufKrU8qQFVKU9Ah8qMM=";
  };

  meta = {
    description = "HyDE Theme: Mac OS";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/1701be171600db27b04f8bf704dc37efe36cd282";
  };
}
