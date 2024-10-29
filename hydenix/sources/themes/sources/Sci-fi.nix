{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Sci-fi";
  src = pkgs.fetchFromGitHub {
    owner = "KaranRaval123";
    repo = "Sci-fi";
    rev = "main";
    sha256 = "sha256-gnAvPuHBfH+PspSxkzOA2jIIHox2Fi+nMSsoZAJHGlw=";
  };

  meta = {
    description = "HyDE Theme: Sci-fi";
    homepage = "https://github.com/KaranRaval123/Sci-fi";
  };
}
