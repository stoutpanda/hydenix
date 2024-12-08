{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Window Manager
    dunst # notification daemon
    rofi-wayland # application launcher
    waybar # system bar
    swww # wallpaper
    swaylock # lock screen
    swaylock-fancy # lock screen
    wlogout # logout menu
    grimblast # screenshot tool
    hyprpicker # color picker
    slurp # region select for screenshot/screenshare
    swappy # screenshot editor
    cliphist # clipboard manager
  ];
}
