{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Frosted Glass";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Frosted-Glass";
    sha256 = "sha256-AsSXRvVvIyhpPB789oSezEpmXCuCrQIDjYTf+PljHmM=";
  };

  meta = {
    description = "HyDE Theme: Frosted Glass";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass";
  };
}
