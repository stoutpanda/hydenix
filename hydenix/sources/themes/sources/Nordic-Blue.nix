{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Nordic Blue";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Nordic-Blue";
    sha256 = "sha256-YyuwnWvd8hMOetFsGpEvk5uiny55mMpSKqhhWzUTwL8=";
  };
  meta = {
    description = "HyDE Theme: Nordic Blue";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Nordic-Blue";
  };
}
