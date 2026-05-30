# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # declarative flatpak
    declarative-flatpak = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # run0-sudo-shim
    run0-sudo-shim = {
      url = "github:LordGrimmauld/run0-sudo-shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, declarative-flatpak, home-manager, run0-sudo-shim, ... }: {
    nixosConfigurations.medo-workstation = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix                       # Your main configuration
        declarative-flatpak.nixosModules.default  # Declarative flatpak support
        ./modules/flatpak.nix                     # Separate flatpak module
        home-manager.nixosModules.home-manager    # home manager support
        ./modules/home-manager.nix                # separate home-manager module
        run0-sudo-shim.nixosModules.default       # enable run0-sudo-shim
        ./modules/run0-sudo-shim.nix              # separate run0-sudo-shim module
      ];
    };
  };
}
