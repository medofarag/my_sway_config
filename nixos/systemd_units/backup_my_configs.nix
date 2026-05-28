{ config, pkgs, ... }:

{
  # difine service
  systemd.user.services.backup_configs = {
    enable = true;
    description = "backup dot files and config files before shutdown";
  
    # exec commands
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # ExecStart Empty because we need to implement script before exit
      ExecStart = "/run/current-system/sw/bin/true";
      ExecStop = "/home/medo/script/backup_my_configs.sh";
    };
  
    wantedBy = [ "default.target" ];
  };
}

