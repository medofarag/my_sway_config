{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Hack:size=10";
        pad = "25x25";
      };
      scrollback.lines = 10000;
    };
  };
}
