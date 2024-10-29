{
  # TODO: match config to hydenix hm config
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
