{ pkgs, mkTheme }:
mkTheme rec {
  name = "Material Sakura";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Material-Sakura";
    name = name;
    sha256 = "sha256-3tM422nWdWPEm7KY7Wh7fQ2KbzzZhBM6Zj8/z1aTVVo=";
  };

  arcs = {
    gtk = "Material-Sakura";
    icon = "Tela-circle-black";
  };

  meta = {
    description = "HyDE Theme: Material Sakura";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Material-Sakura";
    priority = 100;
  };
}
