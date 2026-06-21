{ pkgs, ... }:

{
  # Globálne systémové premenné, ktoré aplikáciám hovoria, aký kurzor použiť.
  # Vďaka tomu ich uvidia aj aplikácie spustené pod UWSM.
  environment.sessionVariables = {
  };
}
