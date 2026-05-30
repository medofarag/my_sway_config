{ config, pkgs, lib, ... }:

{
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
    ];
  };
}
