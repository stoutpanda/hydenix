{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Cat Latte";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Cat-Latte";
    rev = "Cat-Latte";
    sha256 = "sha256-RQ2M4CUQr9xziYRWHLM1zvA9OGZRc0kvfQwv+n4LX5Q=";
  };

  meta = {
    description = "Better Catppuccin-Latte that fixes the inconsistencies of the official theme";
    homepage = "https://github.com/rishav12s/Cat-Latte";
  };
}
