{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Green Lush";
  src = pkgs.fetchFromGitHub {
    owner = "abenezerw";
    repo = "Green-Lush";
    rev = "main";
    sha256 = "sha256-Z0TdPlk5sPIAVZvoZeEbzs61XhTx5p6q9vm3hhhhY0o=";
  };

  meta = {
    description = "HyDE Theme: Green Lush";
    homepage = "https://github.com/abenezerw/Green-Lush";
  };
}
