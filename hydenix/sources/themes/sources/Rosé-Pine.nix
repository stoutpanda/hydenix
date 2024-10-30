{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Rosé Pine";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Rose-Pine";
    name = name;
    sha256 = "sha256-hvTqM45cw580OXK95a09PxSCidFt7T4bVNjizhsb7IQ=";
  };

  meta = {
    description = "HyDE Theme: Rosé Pine";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Rose-Pine";
  };
}
