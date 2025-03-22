{ pkgs, mkTheme }:
mkTheme rec {
  name = "Graphite Mono";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Graphite-Mono";
    name = name;
    sha256 = "sha256-gY7HWmxw7LApPQPYQ0LoKpYKvEVbAS2Gz2rogAi4PFY=";
  };

  arcs = {
    gtk = "Graphite-Mono";
    icon = "Tela-circle-grey";
  };

  meta = {
    description = "HyDE Theme: Graphite Mono";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Graphite-Mono";
    priority = 100;
  };
}
