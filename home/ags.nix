# home/ags.nix
{ inputs, pkgs, ... }: {
  
  # Naimportujeme domovský modul z flake vstupu AGS
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = null; # To znamená, že konfiguráciu v ~/.config/ags budete spravovať sami

    # Nainštalujeme potrebné moduly priamo z repozitára AGS
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      hyprland
      mpris
      wireplumber
      battery
      network
      tray
      io
    ];
  };
}
