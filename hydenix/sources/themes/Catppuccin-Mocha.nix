{ pkgs, mkTheme }:
mkTheme rec {
  name = "Catppuccin Mocha";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Catppuccin-Mocha";
    name = name;
    sha256 = "sha256-YbT1Rm49igI3H1wH21V5f+npjgbj0ya0Dfh9tM62nVI=";
  };

  arcs = {
    gtk = "Catppuccin-Mocha";
    icon = "Tela-circle-dracula";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Mocha";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha";
    priority = 100;
  };
}
