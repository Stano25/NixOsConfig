{
  username = "stano";
  homeDirectory = "/home/stano";
  
  # Toto číslo hovorí NixOSu, s akou verziou bol systém prvýkrát nainštalovaný.
  # Nemení sa ani pri upgrade systému, aby sa neporušili staré databázy.
  stateVersion = "26.05"; 

  # Tu si môžeš prihodiť aj vlastné nastavenia pre tému
  theme = {
    opacity = "0.85";
    terminal = "kitty";
  };
}
