{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Scarlet Night";
  src = pkgs.fetchFromGitHub {
    owner = "abenezerw";
    repo = "Scarlet-Night";
    rev = "main";
    sha256 = "sha256-RtZQpL0ZzjsLOT812JCnhbW6aIya+6I9FO+fCxWIPRY=";
  };

  meta = {
    description = "HyDE Theme: Scarlet Night";
    homepage = "https://github.com/abenezerw/Scarlet-Night";
  };
}
