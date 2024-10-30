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
    # TODO: linkGeneration hangs if more than 10 themes are enabled due to home.file limitations
    themes = [

      # -- Default themes
      "Catppuccin Mocha"
      # "Catppuccin Latte"
      # "Decay Green"
      # "Edge Runner"
      # "Frosted Glass"
      # "Graphite Mono"
      # "Gruvbox Retro"
      # "Material Sakura"
      # "Nordic Blue"
      # "Rose Pine"
      # "Synth Wave"
      # "Tokyo Night"

      # TODO: investigate these themes
      # -- Themes from hyde-gallery (use with caution)
      "Abyssal-Wave"
      # "AbyssGreen"
      # "Bad Blood"
      # "Cat Latte"
      # "Ice Age"
      # "Dracula"
      # "Green Lush"
      # "Greenify"
      # "Hack the Box"
    ];
    activeTheme = "Catppuccin Mocha";
  };

  # Don't change this
  home.stateVersion = "24.11";
}
