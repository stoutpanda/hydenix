{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Monokai";
  src = pkgs.fetchFromGitHub {
    owner = "mahaveergurjar";
    repo = "Theme-Gallery";
    rev = "Monokai";
    name = name;
    sha256 = "sha256-vxIm5Gasnv8xooGnFNFVmZJd7o2YkOORJD2pIQFZrhA=";
  };

  meta = {
    description = "HyDE Theme: Monokai";
    homepage = "https://github.com/mahaveergurjar/Theme-Gallery/tree/Monokai";
  };
}
