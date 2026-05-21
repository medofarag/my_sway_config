# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
    }; 

    grub = {
      enable = false;
      efiSupport = true;
      device = "nodev";
      theme = pkgs.kdePackages.breeze-grub;
    };
  
    efi = {
      canTouchEfiVariables = true; # يسمح لـ NixOS بتعديل إعدادات البيوس تلقائياً
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
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
    LC_TIME = "ar_EG.UTF-8";
  };

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";  # أو "gtk3" أو "kvantum"
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.ly.enable = true;
  # services.desktopManager.plasma6.enable = true;

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swayidle
      swaylock
      swayimg
      waybar
      jq
      mailcap
      foot
      fuzzel
      bemoji
      wl-clipboard
      autotiling
      fnott
      polkit_gnome
      pcmanfm
      gvfs
      xarchiver
      unrar-free
      zip
      unzip
      gsimplecal
      gnome-clocks
      grim
      flameshot
      gpick
      qpdfview
      vlc
      ffmpeg
      ffmpegthumbnailer
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      nwg-look
      nwg-clipman
      libqalculate
      libappimage
      kdePackages.breeze
      kdePackages.breeze-gtk
    ];
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "DejaVu Sans Mono" ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
    packages = with pkgs; [
      font-awesome
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.noto
      unicode-emoji
      liberation_ttf
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      liberation_ttf
      dejavu_fonts
      nerd-fonts.jetbrains-mono
      kdePackages.breeze-icons
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
    jack.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      fsearch
      librewolf
      libreoffice
      emacs
    ];
  };

  services.searx = {
    enable = true;
    settings = {
      use_default_settings = true;
      server = {
        secret_key = "your-strong-secret-key";
        bind_address = "127.0.0.1";
        port = 8888;
      };

      search.safe_search = 1;
      search.autocomplete = "duckduckgo";

    };
  };

  # Install firefox.
  # programs.firefox.enable = true;
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
    toolbox
    lua 
    openjdk
    maven
    nodejs
    playerctl

    btop
    bat
    eza
    starship
    zoxide
    ripgrep
    fd
    tmux
    fzf
    git
    fastfetch
    tree-sitter
  ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["your_username"];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      vhostUserPackages = [ pkgs.virtiofsd ];
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
