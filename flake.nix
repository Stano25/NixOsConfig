{
  description = "Môj moderný Hyprland & AGS Flake Config v /etc/nixos/";

  inputs = {
    # Používame unstable vetvu, ktorá je najlepšia pre Hyprland a AGS
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager pre konfiguráciu usera (Fish, Kitty, AGS)
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follow = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    # Načítanie premenných (meno usera, hostname) z options.nix v rovnakom priečinku
    sysConfig = import ./options.nix;
    system = "x86_64-linux";
  in {
    nixosConfigurations.${sysConfig.hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix

        # Prepojenie Home Managera
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          # Hľadá home.nix priamo vedľa flake.nix v /etc/nixos/
          home-manager.users.${sysConfig.username} = import ./home.nix;
        }
      ];
    };
  };
}
