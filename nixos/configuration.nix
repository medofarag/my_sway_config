# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # systemd services
      ./systemd_units.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = false;
    }; 

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # theme = pkgs.kdePackages.breeze-grub;
    };
  
    efi = {
      canTouchEfiVariables = true;
    };
  };

  # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use zen kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.UTF-8";
    LC_IDENTIFICATION = "ar_EG.UTF-8";
    LC_MEASUREMENT = "ar_EG.UTF-8";
    LC_MONETARY = "ar_EG.UTF-8";
    LC_NAME = "ar_EG.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "ar_EG.UTF-8";
    LC_TELEPHONE = "ar_EG.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment = {
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.sddm.enable = true;

  security.polkit.enable = true;
  hardware.graphics.enable = true;

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "DejaVu Sans Mono" ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
        emoji = [ "unicode-emoji" ];
      };
    };
    packages = with pkgs; [
      font-awesome
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
      nerd-fonts.dejavu-sans-mono
      unicode-emoji
      liberation_ttf
      noto-fonts
      noto-fonts-color-emoji
      dejavu_fonts
      jetbrains-mono
      # google-fonts
    ];
  };

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swayidle
      swaylock
      waybar
      eww
      jq
      mailcap
      foot
      fuzzel
      bemoji
      wl-clipboard
      autotiling
      fnott
      pcmanfm
      xarchiver
      gsimplecal
      gnome-clocks
      grim
      flameshot
      gpick
      ffmpegthumbnailer
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      nwg-look
      libappimage
    ];
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = false;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "podman"];
    packages = with pkgs; [
      # fsearch
      librewolf
      # sage
      # libreoffice
      # nix-search
      # emacs
      # tesseract
      # yt-dlp

      # Kde packages
      haruna
      kdePackages.elisa
      # kdePackages.kolourpaint
      kdePackages.okular
      kdePackages.kate
      # kdePackages.kasts
      kdePackages.gwenview

      # Unfree
      # obsidian
/*
      # Games
      kdePackages.kbreakout
      kdePackages.ksnakeduel
      luanti
      supertux
      supertuxkart
      xonotic
*/
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "luanti-5.14.0"
  ];

  services.searx = {
    enable = true;
    settings = {
      use_default_settings = true;
      server = {
        server.secret_key = "key_key";
        bind_address = "127.0.0.1";
        port = 8888;
      };

      search.safe_search = 1;
      search.autocomplete = "duckduckgo";

    };
  };

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
    "obsidian"
  ];

  # for data usage
  services.vnstat.enable = true;

  # Install firefox.
  # programs.firefox.enable = true;

  # Install neovim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    lua 
    # openjdk
    # maven
    # nodejs

    # media control
    playerctl

    # cli tools
    btop
    bat
    eza
    ripgrep
    fd
    fzf
    git
    fastfetch
    vnstat
    nethogs
    tree-sitter
    libqalculate

    ffmpeg
    unrar-free
    zip
    unzip
    gvfs
    udisks2

    # Disk
    gparted
    btrfs-progs
    ntfs3g
    exfatprogs
    dosfstools
    xfsprogs

    # wine
    wine
    winetricks

    # Themes
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    kdePackages.breeze-grub

    # polkit agent
    polkit_gnome
  ];

  # enable flatpak
  services.flatpak.enable = true;

/*
  # virtmanager
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["medo"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd.qemu = {
    swtpm.enable = true;
  };
*/

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Enable fail2ban to prevent Hacking using random passwords
  services.fail2ban = {
    enable = true;

    # 1. Ignore trusted IP addresses (to prevent blocking yourself)
    ignoreIP = [
      "127.0.0.0/8"   # localhost
      "192.168.1.0/24" # your entire local network (home/office)
      "10.0.0.0/8"    # common internal network range
      # "8.8.8.8"       # example: ignore a specific IP address
    ];

    # 2. Base ban duration (initial ban period)
    bantime = "1h";   # one hour (can be "1d" for a full day)
  
    # 3. Automatically increase ban duration with each new violation
    bantime-increment = {
      enable = true;      # enable automatic increment
      maxtime = "336h";   # maximum: two week (14 days)
      overalljails = true; # count violations across all "jails" (if attacker hits SSH and HTTP together)
    };

    # 4. Number of failed attempts before banning starts
    maxretry = 5;
  
    # 5. Time window during which attempts are counted (findtime = 10 minutes)
    # (findtime is not directly available as a global option, but can be set within each individual "jail")
  };

  # Enable firewall
  networking.firewall = {
    enable = true;
    # Open ports in the firewall.
    allowedTCPPorts = [ 22 80 8888 ]; # ssh http searxng
    # allowedUDPPorts = [ ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
