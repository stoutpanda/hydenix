{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Decay Green";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Decay-Green";
    sha256 = "sha256-/jApdX6ADJOHU9iSCTpGMmL3phNSDHxsrKXX5sBLRGQ=";
  };

  meta = {
    description = "HyDE Theme: Decay Green";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Decay-Green";
  };
}
