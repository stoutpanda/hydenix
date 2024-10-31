{
  userConfig,
  ...
}:

{

  imports = [
    ../../hydenix
  ];

  hydenix = {
    enable = true;
    git = {
      userName = "${userConfig.gitUser}";
      userEmail = "${userConfig.gitEmail}";
    };
    themes = [

      # -- Default themes
      "Catppuccin Mocha"
      "Catppuccin Latte"
      "Decay Green"
      "Edge Runner"
      "Frosted Glass"
      "Graphite Mono"
      "Gruvbox Retro"
      "Material Sakura"
      "Nordic Blue"
      "Rose Pine"
      "Synth Wave"
      "Tokyo Night"

      # -- Themes from hyde-gallery (use with caution)
      "Abyssal-Wave"
      "AbyssGreen"
      "Bad Blood"
      "Cat Latte"
      "Dracula"
      "Edge Runner"
      "Green Lush"
      "Greenify"
      "Hack the Box"
      "Ice Age"
      "Mac OS"
      "Monokai"
      "One Dark"
      "Oxo Carbon"
      "Paranoid Sweet"
      "Rain Dark"
      "Red Stone"
      "Rose Pine"
      "Scarlet Night"
      "Sci-fi"
      "Solarized Dark"
      "Windows 11"
      "Monterey Frost"
      # TODO: fix pixel dream icon build
      # "Pixel Dream"
    ];
    activeTheme = "Catppuccin Mocha";
  };

  # Don't change this
  home.stateVersion = "24.11";
}
