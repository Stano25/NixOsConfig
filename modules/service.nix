{ pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "sk";
    variant = "";
  };
  console.useXkbConfig = true;
  services.xserver.enable = true;
}
