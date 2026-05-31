{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
    enableHidpi = true;
  };

  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "breeze-gtk";
        icon-theme = "Noto Sans Emoji";
        font-name = "Noto Sans Medium 11";
        document-font-name = "Noto Sans Medium 11";
        monospace-font-name = "Noto Sans Mono Medium 11";
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    hyprpanel
    hyprpolkitagent
    hyprlauncher
    hyprlock
    hypridle
    awww
    kitty
    hyprnotify
    hyprkeys
    hyprcursor
    hyprpicker
    gpick
    hyprland-qtutils
    hyprshot

    # theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons

    # Essential apps
    pcmanfm
    xarchiver
    gnome-clocks
    ffmpegthumbnailer
  ];
}
