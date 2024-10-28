{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Hack the Box";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    rev = "Hack-the-Box";
    sha256 = "sha256-hV/HMkudC63R+3TAN2jptTSbexxlGW0IbXshjVnO5VE=";
  };

  meta = {
    description = "HyDE Theme: Hack the Box";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Hack-the-Box";
  };
}
