{
  pkgs,
  cfg,
  ...
}:
let

  # TODO: deduplicate theme.arcs

  # Helper function to create theme entries
  mkTheme = name: {
    inherit name;
    module = ./sources + "/${builtins.replaceStrings [ " " ] [ "-" ] name}.nix";
  };

  # List of theme names
  # TODO: linkGeneration hangs if more than 10 themes are enabled
  themeNames = [
    "Abyssal-Wave"
    "AbyssGreen"
    "Bad Blood"
    "Cat Latte"
    "Catppuccin Latte"

    "Decay Green"
    "Dracula"
    "Edge Runner"
    "Frosted Glass"
    "Graphite Mono"
    "Green Lush"
    "Greenify"
    "Gruvbox Retro"
    "Hack the Box"
    "Ice Age"
    "Mac OS"
    "Material Sakura"
    "Monokai"
    "Nordic Blue"
    "One Dark"
    "Oxo Carbon"
    "Paranoid Sweet"
    "Rain Dark"
    "Red Stone"
    "Rosé Pine"
    "Scarlet Night"
    "Sci-fi"
    "Solarized Dark"
    "Synth Wave"
    "Tokyo Night"
    "Windows 11"
    "Monterey Frost"
    # TODO: Pixel dream icon build breaks due to symlink issues
    # "Pixel Dream"
    "Catppuccin Mocha"
  ];

  # Generate theme list using map
  themes = map mkTheme themeNames;

  themeDerivations = builtins.listToAttrs (
    map (theme: {
      name = theme.name;
      value = pkgs.callPackage theme.module { inherit pkgs; };
    }) themes
  );

  # Filter themes based on name property
  filteredThemes = builtins.filter (theme: builtins.elem theme.name cfg.themes) (
    builtins.attrValues themeDerivations
  );
in
{
  inherit themeDerivations filteredThemes;
}
