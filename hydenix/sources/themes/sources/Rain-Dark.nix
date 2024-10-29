{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Rain Dark";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Rain-Dark";
    rev = "Rain-Dark";
    sha256 = "sha256-1EXbRmCWrcY0NKD9iL+xGmm7ddqLFf4K7ibVSBm2Tuc=";
  };

  meta = {
    description = "HyDE Theme: Rain Dark";
    homepage = "https://github.com/rishav12s/Rain-Dark";
  };
}
