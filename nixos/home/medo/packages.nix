# /etc/nixos/home/medo/packages.nix

{ pkgs, ... }:


{
  home.packages = with pkgs; [
    zoxide
    tmux
  ];
}

