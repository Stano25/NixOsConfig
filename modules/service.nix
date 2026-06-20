{ pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.xserver.enable = true;
}
