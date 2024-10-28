{
  lib,
  activeTheme,
}:

let
  genThemeEnv = import ./gen-theme-env.nix { inherit lib; };
in

lib.mkMerge [
  {
    # Wayland and general environment
    NIXOS_OZONE_WL = "1"; # Enable Ozone Wayland support for Electron-based apps
    MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland support for Mozilla Firefox
    XDG_SESSION_TYPE = "wayland"; # Set the session type to Wayland
    XDG_CURRENT_DESKTOP = "Hyprland"; # Set the current desktop environment to Hyprland
    XDG_SESSION_DESKTOP = "Hyprland"; # Set the session desktop to Hyprland
    XCURSOR_SIZE = "24"; # Set the cursor size
    EDITOR = "nvim"; # Set the default text editor

    # Graphics and display
    GDK_BACKEND = "wayland"; # Set the GDK backend to Wayland
    QT_QPA_PLATFORM = "wayland"; # Set the Qt platform to Wayland
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # Disable window decorations in Qt Wayland
    QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # Enable automatic screen scaling for Qt
    QT_QPA_PLATFORMTHEME = "qt5ct"; # Set the Qt platform theme
    QT_STYLE_OVERRIDE = "kvantum"; # Override the Qt style
    SDL_VIDEODRIVER = "wayland"; # Set the SDL video driver to Wayland
    CLUTTER_BACKEND = "wayland"; # Set the Clutter backend to Wayland
    ELM_DISPLAY = "wl"; # Set the Elementary display to Wayland
    ECORE_EVAS_ENGINE = "wayland-egl"; # Set the Ecore Evas engine to Wayland EGL

    # Application-specific
    _JAVA_AWT_WM_NONREPARENTING = "1"; # Fix for Java applications under non-reparenting window managers
    MOZ_WEBRENDER = "1"; # Enable WebRender in Firefox for better performance

    # VM-specific
    LIBGL_ALWAYS_SOFTWARE = "1"; # Force software rendering for OpenGL
    GBM_BACKEND = "virgl"; # Set the GBM backend to virgl for virtual machines
    __GL_VENDOR_LIBRARY_NAME = "mesa"; # Set the OpenGL vendor library to Mesa

    # GTK/GNOME theme settings
    ICON_THEME = activeTheme.arcs.icon.name or "Tela-circle-dracula";
    # TODO: hyde.conf: when wallbash is 2 or 3 this this should be mkForced
    GTK_THEME = activeTheme.arcs.gtk.name or "Wallbash-Gtk";
    COLOR_SCHEME = "prefer-dark";
    FONT_NAME = activeTheme.arcs.font.name or "Cantarell 10";
    CURSOR_THEME = activeTheme.arcs.cursor.name or "Bibata-Modern-Ice";
    CURSOR_SIZE = "20";
    DOCUMENT_FONT_NAME = activeTheme.arcs.font.name or "Cantarell 10";
    MONOSPACE_FONT_NAME = "JetBrains Mono 9";
    FONT_ANTIALIASING = "rgba";
    FONT_HINTING = "full";

    GTK_USE_PORTAL = "1";

  }

  # Theme environment variables
  (genThemeEnv activeTheme.name)
]
