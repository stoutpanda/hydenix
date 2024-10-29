{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "One Dark";
  src = pkgs.fetchFromGitHub {
    owner = "RAprogramm";
    repo = "HyDe-Themes";
    rev = "One-Dark";
    sha256 = "sha256-j4KXbLb7gvVNCrdqMscsIinhBZoBp4oIzEbwws4fstU=";
  };

  meta = {
    description = "HyDE Theme: One Dark";
    homepage = "https://github.com/RAprogramm/HyDe-Themes/tree/One-Dark";
  };
}
