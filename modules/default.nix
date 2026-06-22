{ ... }: {
  imports = [
    ./user.nix
    ./packages.nix
    ./service.nix
    ./home.nix
    ./bootloader.nix
    ./sddm.nix
    ./setting.nix
    ./network.nix
    ./locales.nix
  ];
}
