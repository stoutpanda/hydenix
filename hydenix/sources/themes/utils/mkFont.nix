{ pkgs }:

args:
pkgs.stdenv.mkDerivation {
  name = args.fontName;
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.src.url;
    sha256 = args.src.sha256;
    stripRoot = true;
  };

  dontConfigure = true;
  dontBuild = true;
  dontDropIconThemeCache = true;
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/fonts/${args.fontName}"

    # Copy all font files directly to fonts directory
    cp -a * "$out/share/fonts/${args.fontName}"

    runHook postInstall
  '';
}
