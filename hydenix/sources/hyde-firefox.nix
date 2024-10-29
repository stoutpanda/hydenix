{
  lib,
  pkgs,
}:

let
  # Create the setup script with improved error handling and display check
  setupScript = pkgs.writeShellScript "setup-hyde-firefox" ''
    set -e

    # Get the directory where the script is located
    SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
    INSTALL_DIR="$(dirname "$SCRIPT_DIR")"

    FIREFOX_DIR="$HOME/.mozilla/firefox"
    PROFILE_INI="$FIREFOX_DIR/profiles.ini"

    # Ensure firefox directory exists
    mkdir -p "$FIREFOX_DIR"

    if [ ! -f "$PROFILE_INI" ]; then
      echo "Firefox profile not found. Creating a new profile..."
      # Run Firefox in headless mode to create profile
      ${pkgs.firefox}/bin/firefox --headless -CreateProfile "hyde-profile $FIREFOX_DIR/hyde-profile"
      sleep 2  # Give Firefox time to create the profile
    fi

    # Verify profile creation
    if [ ! -f "$PROFILE_INI" ]; then
      echo "Failed to create Firefox profile. Please check Firefox installation."
      exit 1
    fi

    PROFILE_PATH=$(grep -E "^Path=" "$PROFILE_INI" | head -n 1 | cut -d '=' -f2)
    if [ -z "$PROFILE_PATH" ]; then
      echo "Could not find Firefox profile path. Exiting."
      exit 1
    fi

    echo "Using Firefox profile: $PROFILE_PATH"

    # Copy user configuration (updated path)
    mkdir -p "$FIREFOX_DIR/$PROFILE_PATH/chrome"
    if ! cp -r "$INSTALL_DIR/share/firefox/userconfig/"* "$FIREFOX_DIR/$PROFILE_PATH/chrome/"; then
      echo "Failed to copy Firefox configuration files. Exiting."
      exit 1
    fi

    echo "Hyde Firefox setup complete!"
  '';
in
pkgs.stdenv.mkDerivation {
  pname = "hyde-firefox";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = "https://github.com/prasanthrangan/hyprdots/raw/main/Source/arcs/Firefox_UserConfig.tar.gz";
    sha256 = "sha256-M/+5HF/kUvSDf6fuFwcJUv2RK58/jEDd94BaLbXHVFw=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir -p $out/share/firefox/userconfig
    mkdir -p $out/bin

    cp -r * $out/share/firefox/userconfig/
    cp ${setupScript} $out/bin/setup-hyde-firefox
  '';

  meta = with lib; {
    description = "Custom Firefox user configuration";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
