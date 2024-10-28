{ pkgs, lib, ... }:
themes:

let
  # Generate a list of packages for a single theme
  mkThemePackages =
    theme:
    let
      # Start with the base theme package
      basePackages = if theme ? pkg then [ theme.pkg ] else [ ];

      # Helper to add package if arc exists and has a package
      addArcPackage =
        packages: arc:
        if (arc != null && arc ? pkg && arc.pkg != null) then packages ++ [ arc.pkg ] else packages;

      # Get arc safely with null fallback
      getArc =
        theme: arcName:
        if (theme ? arcs && theme.arcs ? ${arcName} && theme.arcs.${arcName} != null) then
          theme.arcs.${arcName}
        else
          null;
    in
    # Fold over all possible arc types to build final package list
    lib.foldl addArcPackage basePackages [
      (getArc theme "gtk")
      (getArc theme "icon")
      (getArc theme "cursor")
      (getArc theme "font")
    ];
in
lib.flatten (lib.filter (x: x != [ ]) (map mkThemePackages themes))
