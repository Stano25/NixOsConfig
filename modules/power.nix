{ config, pkgs, ... }:

{
  services.auto-cpufreq.enable = true;
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

  # Power profiles daemon (aby si ho mohol ovládať cez AGS)
  # POZOR: Niektoré systémy sa bijú s auto-cpufreq, ak to nepôjde,
  # použi len jedno z nich.
  services.power-profiles-daemon.enable = true;
}
