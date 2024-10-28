{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Oxo Carbon";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Oxo-Carbon";
    rev = "Oxo-Carbon";
    sha256 = "sha256-qxqdP5rInvHy2Irm6pxlujhSPaVm+i4YoQ2/4dS4vhw=";
  };
  meta = {
    description = "HyDE Theme: Oxo Carbon";
    homepage = "https://github.com/rishav12s/Oxo-Carbon";
  };
}
