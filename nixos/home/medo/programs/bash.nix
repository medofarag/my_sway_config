# /etc/nixos/home/programs/bash.nix
{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      alias ll='ls -al'
      alias update='sudo nixos-rebuild switch --flake /etc/nixos#medo'
      alias hms='home-manager switch --flake /etc/nixos#medo'
    '';
  };
}
