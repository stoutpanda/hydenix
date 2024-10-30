{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Tokyo Night";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Tokyo-Night";
    name = name;
    sha256 = "sha256-YL91+Q7CIGT+Ams9FOdw343OgQ19NWz6GJZEG37Gg9A=";
  };

  meta = {
    description = "HyDE Theme: Tokyo Night";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Tokyo-Night";
  };
}
