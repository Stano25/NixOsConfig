{ config, pkgs, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };

in {
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    }; 
    autoNumlock = true;
    enableHidpi = true;
    theme = "sddm-astronaut-theme";

    extraPackages = with pkgs; [
      custom-sddm-astronaut
      nordzy-cursor-theme # KĽÚČOVÉ: SDDM ho musí mať tu, aby ho videl!
      kdePackages.qtsvg
    ];

    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
        CursorTheme = "Nordzy-cursors"; # Názov čiernej/tmavej témy
        CursorSize = 24;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
    nordzy-cursor-theme # KĽÚČOVÉ: Aby bol dostupný aj pre Hyprland
  ];
}
