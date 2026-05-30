{ config, pkgs, lib, ... }:

{
  security.sudo.enable = false;
  security.run0-sudo-shim.enable = true;
  security.polkit.persistentAuthentication = true;
  services.dbus.implementation = "broker";
}
