# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # declarative flatpak
    declarative-flatpak = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, declarative-flatpak, home-manager, ... }: {
    nixosConfigurations.medo-workstation = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix                       # Your main configuration
        # declarative-flatpak.nixosModules.default  # Declarative flatpak support
        # ./modules/flatpak.nix                     # Separate flatpak module
        home-manager.nixosModules.home-manager    # home manager support
        ./modules/home-manager.nix                # separate home-manager module
      ];
    };
  };
}
