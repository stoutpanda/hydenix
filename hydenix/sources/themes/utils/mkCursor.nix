{ pkgs }:

args:
pkgs.stdenv.mkDerivation {
  name = args.cursorName;
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.src.url;
    sha256 = args.src.sha256;
  };

  nativeBuildInputs = [
    pkgs.jdupes
  ];

  dontConfigure = true;
  dontBuild = true;
  dontDropIconThemeCache = true;
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/icons/${args.cursorName}"

    cp -r . "$out/share/icons/${args.cursorName}/"

    jdupes -r "$out/share/icons/${args.cursorName}"

    runHook postInstall
  '';
}
