{ pkgs }:

args:
let
  normalizedName = builtins.replaceStrings [ " " ] [ "-" ] args.iconName;
in
pkgs.stdenv.mkDerivation {
  name = "hyde-icon-${normalizedName}";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.url;
    hash = args.hash;
    name = "hyde-icon-${normalizedName}-source";
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
