{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Monterey Frost";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Monterey-Frost";
    rev = "main";
    name = name;
    sha256 = "sha256-II0UBeqTK2TPeXvY4HuTsmqRkGMrjq5jSSVWvR/hm8M=";
  };

  meta = {
    description = "Mac-OS inspired dark theme";
    homepage = "https://github.com/rishav12s/Monterey-Frost";
  };
}
