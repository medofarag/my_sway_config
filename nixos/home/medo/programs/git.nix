# /etc/nixos/home/programs/git.nix
{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "MedoFarag";
    userEmail = "medofarag@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
