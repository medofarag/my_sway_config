{ config, pkgs, lib, ... }:

{
  # Enable Gnome
  services.desktopManager.gnome.enable = true;
  
  # Enable gdm displayManager
  services.displayManager.gdm = {
    enable = true;
  };

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour gnome-user-docs 
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.arc-menu
  ];
}
