{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Catppuccin Latte";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Catppuccin-Latte";
    name = name;
    sha256 = "sha256-WX+knhJnlnSMsNrof+b1d5+kGIGsmRWi962HhkBRJyc=";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Latte";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Latte";
  };
}
