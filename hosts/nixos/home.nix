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
    # TODO: linkGeneration hangs if more than 10 themes are enabled
    themes = [
      "Abyssal-Wave"
      "AbyssGreen"
      # "Bad Blood"
      # "Cat Latte"
      # "Catppuccin Latte"
      # "Catppuccin Mocha"
      # "Decay Green"
      # "Dracula"
      # "Edge Runner"
      # "Frosted Glass"
      # "Graphite Mono"
      # "Green Lush"
      # "Greenify"
      # "Gruvbox Retro"
      # "Hack the Box"
      # "Ice Age"
      # "Material Sakura"
    ];
    activeTheme = "Abyssal-Wave";
  };

  # Don't change this
  home.stateVersion = "24.11";
}
