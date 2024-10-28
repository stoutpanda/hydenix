{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Pixel Dream";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Pixel-Dream";
    rev = "main";
    sha256 = "sha256-vPtWjTWHttUPJBtxcJY9jiBrP6jH/r0IIwGmmoINQyw=";
  };

  meta = {
    description = "Pixel Art inspired theme";
    homepage = "https://github.com/rishav12s/Pixel-Dream";
  };
}
