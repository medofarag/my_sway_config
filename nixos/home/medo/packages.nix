# /etc/nixos/home/medo/packages.nix

{ pkgs, ... }:


{
  home.packages = with pkgs; [
    zoxide
    tmux
    cbonsai
    cmatrix
    asciiquarium

    fsearch
    librewolf
    # sage
    # octave
    # libreoffice
    nix-search
    emacs
    # tesseract
    # yt-dlp

    # Kde packages
    haruna
    kdePackages.elisa
    kdePackages.kolourpaint
    kdePackages.okular
    kdePackages.kate
    kdePackages.kasts

    # Games
    luanti
    # supertux
    # supertuxkart
    # xonotic

  ];
}

