# /etc/nixos/modules/home-manager.nix
{ config, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    
    # user settings from separated file
    users.medo = import ../home/medo/home.nix;
  };
}
