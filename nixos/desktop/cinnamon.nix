{ config, pkgs, lib, ... }:

{
  # Enable Cinnamon
  services.xserver.desktopManager.cinnamon.enable = true;
  environment.cinnamon.excludePackages = [
    pkgs.blueman
  ];
  # for online accounts
  services.gnome.gnome-online-accounts.enable = true;
}
