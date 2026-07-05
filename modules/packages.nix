{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.fish.enable = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    zed-editor
    fastfetch
    hyprpaper
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];
}
