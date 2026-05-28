# /etc/nixos/home/default.nix
{ config, pkgs, ... }:

{
  imports = [
    # ./packages.nix
    ./programs/git.nix
    # ./programs/bash.nix
    ./programs/starship.nix
  ];

  home.username = "medo";
  home.homeDirectory = "/home/medo";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
