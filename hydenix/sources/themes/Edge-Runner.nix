{ pkgs, mkTheme }:
mkTheme rec {
  name = "Edge Runner";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Edge-Runner";
    name = name;
    sha256 = "sha256-c5BKdcZw5Yd+bxwpc+PDtKrtZwNGkRlU1R/Y0APq/iA=";
  };

  arcs = {
    gtk = "Edge-Runner";
    icon = "Tela-circle-yellow";
  };

  meta = {
    description = "HyDE Theme: Edge Runner";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Edge-Runner";
    priority = 100;
  };
}
