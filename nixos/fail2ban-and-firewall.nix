{ config, pkgs, lib,... }:

{
  # Enable fail2ban to prevent Hacking using random passwords
  services.fail2ban = {
    enable = true;

    # 1. Ignore trusted IP addresses (to prevent blocking yourself)
    ignoreIP = [
      "127.0.0.0/8"   # localhost
      "192.168.1.0/24" # your entire local network (home/office)
      "10.0.0.0/8"    # common internal network range
      # "127.0.0.1"       # example: ignore a specific IP address
    ];

    # 2. Base ban duration (initial ban period)
    bantime = "1h";   # one hour (can be "1d" for a full day)
  
    # 3. Automatically increase ban duration with each new violation
    bantime-increment = {
      enable = true;      # enable automatic increment
      maxtime = "336h";   # maximum: two week (14 days)
      overalljails = true; # count violations across all "jails" (if attacker hits SSH and HTTP together)
    };

    # 4. Number of failed attempts before banning starts
    maxretry = 5;
  
    # 5. Time window during which attempts are counted (findtime = 10 minutes)
    # (findtime is not directly available as a global option, but can be set within each individual "jail")
  };

  # Enable firewall
  networking.firewall = {
    enable = true;
    # Open ports in the firewall.
    allowedTCPPorts = [ 22 80 8888 ]; # ssh http searxng
    # allowedUDPPorts = [ ];
  };
}
