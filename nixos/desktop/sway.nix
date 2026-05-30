{ config, pkgs, lib, ... }:

{
  services.displayManager.ly = {
    enable = true;
  };

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swayidle
      swaylock
      waybar
      eww
      mailcap
      foot
      fuzzel
      bemoji
      wl-clipboard
      autotiling
      fnott
      pcmanfm
      xarchiver
      gsimplecal
      gnome-clocks
      grim
      flameshot
      gpick
      ffmpegthumbnailer
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      nwg-look
      libappimage
      kdePackages.gwenview
      polkit_gnome

      # Themes
      kdePackages.breeze
      kdePackages.breeze-gtk
      kdePackages.breeze-icons
      kdePackages.breeze-grub
    ];
  };
}
