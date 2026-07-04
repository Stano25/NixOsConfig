{ config, pkgs, ... }:

{
  services.auto-cpufreq.enable = true;

  services.power-profiles-daemon.enable = false;

  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "powersave"; #governor = "performance";
       turbo = "never"; #turbo = "auto";
    };
  };
  # Intel procesor nastavenie
  services.thermald.enable = true;
}
