{ pkgs, ... }:
let
  fonts = import ../sources/hyde-fonts.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Dependencies

    # System & Desktop Integration
    polkit_gnome # authentication agent for privilege escalation
    dbus # inter-process communication daemon
    upower # power management/battery status daemon
    mesa # OpenGL implementation and GPU drivers
    dconf # configuration storage system
    home-manager # user environment manager

    # XDG
    xdg-utils # Collection of XDG desktop integration tools

    # TODO: move to qt6, currently bugs waybar and any qt6 apps
    # Qt6/KDE Components
    kdePackages.qtimageformats # Additional image format plugins for Qt6
    kdePackages.ffmpegthumbs # FFmpeg-based video thumbnails for Qt6
    kdePackages.kde-cli-tools # KDE command line tools
    kdePackages.kdegraphics-thumbnailers # KDE graphics file thumbnails
    kdePackages.kimageformats # Additional image format plugins for KDE
    kdePackages.qtimageformats # imageformats for Qt6
    kdePackages.qtwayland # Qt6 Wayland integration
    kdePackages.qtsvg # SVG support for Qt6
    kdePackages.qtbase # Qt6 base libraries
    kdePackages.kio # KDE Input/Output framework
    kdePackages.kio-extras # Additional KIO protocols and file systems
    kdePackages.kwayland # KDE Wayland integration library
    kdePackages.qt5compat # Qt5 compatibility layer for Qt6
    kdePackages.qtstyleplugin-kvantum # Qt6 Kvantum style plugin
    kdePackages.qt6ct # Qt6 configuration tool
    kdePackages.qt6gtk2 # GTK2-style widgets for Qt6

    # Utilities & Tools
    parallel # Shell tool for executing jobs in parallel
    jq # Command-line JSON processor
    imagemagick # Image manipulation tools
    resvg # SVG rendering library and tools
    libnotify # Desktop notification library
    emote # GTK3-based emoji picker
    flatpak # Universal application deployment system
    envsubst # Environment variable substitution utility
    killall # Process termination utility
    wl-clipboard # Wayland clipboard utilities
    gnumake # Build automation tool

    # Hyprland Specific
    hyprcursor # Cursor theme engine for Hyprland
    hyprutils # Utility tools for Hyprland

    # Fonts & Theming
    fonts # Hyde font collection

    # TODO: build python-pyamdgpuinfo from https://github.com/mark9064/pyamdgpuinfo
    # python-pyamdgpuinfo # for amd gpu info
  ];
}
