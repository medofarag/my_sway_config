# /etc/nixos/home/default.nix
{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/starship.nix
  ];

  home.username = "medo";
  home.homeDirectory = "/home/medo";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
