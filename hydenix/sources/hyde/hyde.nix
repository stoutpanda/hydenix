{ pkgs, commit }:
pkgs.stdenv.mkDerivation {
  name = "hyde-modified";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "HyDE";
    rev = commit;
    sha256 = "sha256-tx6bgjp42c1MPoigoylNEtLDYOn4vNi0IkN1HvBO12A=";
  };

  buildPhase = ''
    # Update waybar killall command in all HyDE files
    find . -type f -print0 | xargs -0 sed -i 's/killall waybar/killall .waybar-wrapped/g'

    # update dunst
    find . -type f -print0 | xargs -0 sed -i 's/killall dunst/killall .dunst-wrapped/g'

    # update kitty
    find . -type f -print0 | xargs -0 sed -i 's/killall kitty/killall .kitty-wrapped/g'

    # fix find commands for symlinks
    find . -type f -executable -print0 | xargs -0 sed -i 's/find "/find -L "/g'
    find . -type f -name "*.sh" -print0 | xargs -0 sed -i 's/find "/find -L "/g'
  '';

  installPhase = ''
    mkdir -p $out/share/hyde/hyde-modified
    cp -r . $out/share/hyde/hyde-modified
  '';
}
