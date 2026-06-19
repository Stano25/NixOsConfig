# home.nix
{ config, pkgs, ... }:

let
  # Načítanie nášho nového konfiguračného súboru
  sysConfig = import ./options.nix;
in
{
  # Použitie hodnôt z options.nix
  home.username = sysConfig.username;
  home.homeDirectory = sysConfig.homeDirectory;
  home.stateVersion = sysConfig.stateVersion;

  # --- Tvoja konfigurácia zostáva čistá ---
  programs.fish = {
    enable = true;
    # Tu si môžeš neskôr pridať napr. aliasy:
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch";
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = sysConfig.theme.opacity; # Aj toto sme vytiahli do configu!
      confirm_os_window_close = 0;
    };
  };

  home.packages = with pkgs; [
    aylurs-gtk-shell
    bun
    typescript
  ];

  programs.home-manager.enable = true;
}
