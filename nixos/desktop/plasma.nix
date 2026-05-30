{ config, pkgs, lib, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    wayland.enable = true;
    enableHidpi = true;
    settings = {
      /*
      Autologin = {
        Session = "plasma.desktop";
        User = "john";
      };
      */
    };
  };
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.okular
  ]; 
}
