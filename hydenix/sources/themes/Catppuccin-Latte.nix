{ pkgs, mkTheme }:
mkTheme rec {
  name = "Catppuccin Latte";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Catppuccin-Latte";
    name = name;
    sha256 = "sha256-WX+knhJnlnSMsNrof+b1d5+kGIGsmRWi962HhkBRJyc=";
  };

  arcs = {
    gtk = "Catppuccin-Latte";
    icon = "Tela-circle-grey";
  };

  meta = {
    priority = 100;
    description = "HyDE Theme: Catppuccin Latte";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Latte";
  };
}
