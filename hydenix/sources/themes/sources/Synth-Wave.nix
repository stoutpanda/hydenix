{ pkgs, lib }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme {
  name = "Synth Wave";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "Synth-Wave";
    sha256 = "sha256-2qkR61CaUyHry/clQb7WVMSt4rV+4c4yElRxqSwF73Y=";
  };

  meta = {
    description = "HyDE Theme: Synth Wave";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Synth-Wave";
  };
}
