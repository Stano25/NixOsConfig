{ config, pkgs, ... }:
{
  imports = [
    ./ags.nix
    ./kitty.nix
    ./fish.nix
  ];

  home = {
    username = "stano";
    homeDirectory = "/home/stano";
    stateVersion = "26.05";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
