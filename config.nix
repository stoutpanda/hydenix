rec {
  username = "hydenix";
  gitUser = "hydenix";
  gitEmail = "exampleEmail";
  host = "hydenix";
  /*
    Default password is required for sudo support in systems
    !REMEMBER TO USE passwd TO CHANGE THE PASSWORD!
  */
  defaultPassword = "hydenix";
  timezone = "America/Vancouver";
  locale = "en_CA.UTF-8";

  hyde = {
    sddmTheme = "Candy"; # or "Corners"

    enable = true;

    # git config, useful for initial setup
    git = {
      userName = "${username}";
      userEmail = "${gitEmail}";
    };

    # active theme, must be in themes list
    activeTheme = "Catppuccin Mocha";

    # list of themes to choose from
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

      # -- Themes from hyde-gallery (use with caution)
      # "Abyssal-Wave"
      # "AbyssGreen"
      # "Bad Blood"
      # "Cat Latte"
      # "Dracula"
      # "Edge Runner"
      # "Green Lush"
      # "Greenify"
      # "Hack the Box"
      # "Ice Age"
      # "Mac OS"
      # "Monokai"
      # "One Dark"
      # "Oxo Carbon"
      # "Paranoid Sweet"
      # "Rain Dark"
      # "Red Stone"
      # "Rose Pine"
      # "Scarlet Night"
      # "Sci-fi"
      # "Solarized Dark"
      # "Windows 11"
      # "Monterey Frost"
      # TODO: fix pixel dream icon build
      # "Pixel Dream"
    ];
  };

  vm = {
    # 4 GB minimum
    memorySize = 8192;
    # 2 cores minimum
    cores = 4;
    # TODO: review, it also seems to matter which vm is run
    # 30GB minimum for one theme - 50GB for multiple themes - more for development and testing
    diskSize = 30000;
  };
}
