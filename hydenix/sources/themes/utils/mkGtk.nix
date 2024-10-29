{ pkgs }:

args:
pkgs.stdenv.mkDerivation {
  name = args.gtkName;
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

    mkdir -p "$out/share/themes/${args.gtkName}"

    # Copy theme contents directly to themes directory
    cp -a * "$out/share/themes/${args.gtkName}"

    runHook postInstall
  '';
}
