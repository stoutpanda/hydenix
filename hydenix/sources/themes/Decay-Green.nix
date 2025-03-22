{ pkgs, mkTheme }:
mkTheme rec {
  name = "Decay Green";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Decay-Green";
    name = name;
    sha256 = "sha256-/jApdX6ADJOHU9iSCTpGMmL3phNSDHxsrKXX5sBLRGQ=";
  };

  arcs = {
    gtk = "Decay-Green";
    icon = "Tela-circle-green";
  };

  meta = {
    description = "HyDE Theme: Decay Green";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Decay-Green";
    priority = 100;
  };
}
