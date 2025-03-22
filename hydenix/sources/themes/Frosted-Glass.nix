{ pkgs, mkTheme }:
mkTheme rec {
  name = "Frosted Glass";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Frosted-Glass";
    name = name;
    sha256 = "sha256-AsSXRvVvIyhpPB789oSezEpmXCuCrQIDjYTf+PljHmM=";
  };

  arcs = {
    gtk = "Frosted-Glass";
    icon = "Tela-circle-blue";
  };

  meta = {
    description = "HyDE Theme: Frosted Glass";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass";
    priority = 100;
  };
}
