# /etc/nixos/home/programs/git.nix
{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "MedoFarag";
      user.email = "medofarag@proton.me";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };
  };
}
