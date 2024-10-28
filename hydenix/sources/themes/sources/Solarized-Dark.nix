{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Solarized Dark";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Solarized-Dark";
    rev = "Solarized-Dark";
    sha256 = "sha256-hZb94uJt5XuTJToL+ljQTXOBBKBCkrytD7jwV8Ck7ug=";
  };

  meta = {
    description = "HyDE Theme: Solarized Dark";
    homepage = "https://github.com/rishav12s/Solarized-Dark";
  };
}
