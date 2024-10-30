{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Gruvbox Retro";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Gruvbox-Retro";
    name = name;
    sha256 = "sha256-/6CZmFjmUOIw5qCQSURcjsHL6vsA1b5yIfzKi3fd88k=";
  };

  meta = {
    description = "HyDE Theme: Gruvbox Retro";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Gruvbox-Retro";
  };
}
