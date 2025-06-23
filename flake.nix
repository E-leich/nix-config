{
  description = "NixOS config with modular host directories and Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "eleich";
      hostname = "asus-tuf";
    in
    {
      nixosConfigurations = {
        # Use lib.nixosSystem to build the system config
        "${hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit self nixpkgs home-manager;
            username = username;
            hostname = hostname;
          };

          modules = [
            ./hosts/${hostname}/default.nix
            home-manager.nixosModules.home-manager
            {
              # Enable global pkgs for Home Manager and your user config
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users."${username}" = import ./home/users/${username}.nix;
            }
          ];
        };
      };
    };
}

