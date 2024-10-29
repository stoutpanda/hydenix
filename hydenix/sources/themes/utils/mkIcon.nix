{ pkgs }:

args:
pkgs.stdenv.mkDerivation {
  name = args.iconName;
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.src.url;
    sha256 = args.src.sha256;
    # Add stripRoot to avoid unnecessary nesting
    stripRoot = true;
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

    # Create target directory
    mkdir -p "$out/share/icons/${args.iconName}"

    # Copy contents directly to the target directory, avoiding double nesting
    cp -a * "$out/share/icons/${args.iconName}"

    # Run jdupes with more aggressive optimization flags
    jdupes -r "$out/share/icons/${args.iconName}"

    runHook postInstall
  '';
}
