{ pkgs }:

args:
pkgs.stdenv.mkDerivation {
  name = args.iconName;
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.src.url;
    sha256 = args.src.sha256;
    # Add stripRoot to avoid unnecessary nesting
    stripRoot = false;
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

    # Create target directory and copy files in one operation
    mkdir -p "$out/share/icons/${args.iconName}"
    cp -a . "$out/share/icons/${args.iconName}/"

    # Run jdupes with more aggressive optimization flags
    jdupes -r "$out/share/icons/${args.iconName}"

    runHook postInstall
  '';
}
