{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Abyssal-Wave";
  src = pkgs.fetchFromGitHub {
    owner = "Itz-Abhishek-Tiwari";
    repo = "Abyssal-Wave";
    rev = "main";
    name = name;
    sha256 = "sha256-VpKPKgRQMQhDWmlrFignZ1tN69MB/cd8KBsAARMIKIo=";
  };

  meta = {
    name = name;
    description = "HyDE Theme: Abyssal-Wave";
    homepage = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave";
  };
}
