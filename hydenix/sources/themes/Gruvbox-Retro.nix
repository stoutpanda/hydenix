{ pkgs, mkTheme }:
mkTheme rec {
  name = "Gruvbox Retro";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Gruvbox-Retro";
    name = name;
    sha256 = "sha256-/6CZmFjmUOIw5qCQSURcjsHL6vsA1b5yIfzKi3fd88k=";
  };

  arcs = {
    gtk = "Gruvbox-Retro";
    icon = "Gruvbox-Plus-Dark";
    cursor = "Gruvbox-Retro";
  };

  meta = {
    description = "HyDE Theme: Gruvbox Retro";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Gruvbox-Retro";
    priority = 100;
  };
}
