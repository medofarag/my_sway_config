{ config, pkgs,... }:

{
  imports = 
    [
      ./services/polkit.nix
      ./services/searxng.nix
    ];
}
