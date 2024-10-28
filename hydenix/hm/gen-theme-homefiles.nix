{ pkgs, lib }:
themes:
lib.mkMerge (
  (map (theme: {
    ".config/hyde/themes/${theme.name}" = {
      source = "${theme.pkg}/${theme.name}";
      force = true;
      recursive = true;
      mutable = true;
    };
  }) themes)
)
