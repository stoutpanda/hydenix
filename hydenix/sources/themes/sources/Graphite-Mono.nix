{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Graphite Mono";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Graphite-Mono";
    sha256 = "sha256-gY7HWmxw7LApPQPYQ0LoKpYKvEVbAS2Gz2rogAi4PFY=";
  };

  meta = {
    description = "HyDE Theme: Graphite Mono";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Graphite-Mono";
  };
}
