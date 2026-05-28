# /etc/nixos/home/programs/starship.nix
{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 100;
    };
  };
}
