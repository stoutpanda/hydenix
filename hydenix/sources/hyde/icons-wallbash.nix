{
  pkgs,
  hyde,
}:

pkgs.stdenv.mkDerivation {
  name = "wallbash-icons";
  src = hyde.wallbash-icons;
}
