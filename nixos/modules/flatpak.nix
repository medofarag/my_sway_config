# /etc/nixos/modules/flatpak.nix
# Separate module for Flatpak configuration

{ config, pkgs, lib, ... }:

{
  # Enable Flatpak service
  services.flatpak = {
    enable = true;
    
    # Applications to install declaratively
    packages = [
      
    ];
    
    # Add Flathub remote repository
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    
    # Automatic updates configuration
    onCalendar = "monthly";  # Updates every month
  };
}
