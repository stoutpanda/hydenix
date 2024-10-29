{ lib, ... }:
theme:
let
  themeStore = builtins.fromJSON (builtins.readFile ../sources/themes/utils/themes.json);

  # Helper function to get theme config from store
  getThemeConfig = name: themeStore.${name} or null;

  defineIfNotNull = name: value: if value != null then { "${name}" = lib.mkForce value; } else { };

  # Get theme config for the single input theme
  themeConfig = getThemeConfig theme;
in
if themeConfig != null then
  defineIfNotNull "GTK_THEME" themeConfig.gtk
  // defineIfNotNull "ICON_THEME" themeConfig.icon
  // defineIfNotNull "CURSOR_THEME" themeConfig.cursor
  // defineIfNotNull "FONT" themeConfig.font
else
  { }
