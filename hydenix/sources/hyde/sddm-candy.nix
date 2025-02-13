{
  pkgs,
  commit,
}:
pkgs.stdenv.mkDerivation {
  pname = "sddm-candy-theme";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = "https://github.com/HyDE-Project/HyDE/raw/${commit}/Source/arcs/Sddm_Candy.tar.gz";
    hash = "sha256-H8qmLpTFFaTFJVSKAHQBMacPCWlySagmWLTvNYrv7Ds=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/Candy
    cp -r * $out/share/sddm/themes/Candy
  '';

  meta = with pkgs.lib; {
    description = "Candy theme for SDDM";
    homepage = "https://github.com/HyDE-Project/HyDE";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
