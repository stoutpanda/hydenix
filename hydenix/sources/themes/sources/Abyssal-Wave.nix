{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Abyssal-Wave";
  src = pkgs.fetchFromGitHub {
    owner = "Itz-Abhishek-Tiwari";
    repo = "Abyssal-Wave";
    rev = "main";
    sha256 = "sha256-VpKPKgRQMQhDWmlrFignZ1tN69MB/cd8KBsAARMIKIo=";
  };

  meta = {
    description = "HyDE Theme: Abyssal-Wave";
    homepage = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave";
  };
}
