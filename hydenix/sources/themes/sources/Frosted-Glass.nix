{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Frosted Glass";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Frosted-Glass";
    name = name;
    sha256 = "sha256-AsSXRvVvIyhpPB789oSezEpmXCuCrQIDjYTf+PljHmM=";
  };

  meta = {
    description = "HyDE Theme: Frosted Glass";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass";
  };
}
