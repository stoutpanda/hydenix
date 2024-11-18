{ userConfig, ... }:
{
  programs.git = {
    enable = true;
    userName = userConfig.gitUser;
    userEmail = userConfig.gitEmail;
  };
}
