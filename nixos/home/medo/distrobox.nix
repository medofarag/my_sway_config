{ config, pkgs, ... }: 

{
  programs.distrobox = {
    enable = true;
    containers = {
      # Example
      /*
      "debian-base" = {
        image = "debian:12";
        init = true;
        additional_packages = "git curl wget";
        init_hooks = [
          "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker"
        ];
      };
      
      "dev-env" = {
        clone = "debian-base";
        image = "ubuntu:22.04";
        additional_packages = "python3 nodejs";
        entry = true;
      };
      */

      "Archlinux" = {
        image = "archlinux:latest";
        init = true;
        additional_packages = "base-devel git";
      }; # End for archlinux container
    }; # End for containers
  }; # End for distrobox
}
