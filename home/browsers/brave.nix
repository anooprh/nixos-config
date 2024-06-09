{ inputs, config, pkgs, lib, system, user, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { 
        # Bitwarden
        id = "nngceckbapebfimnlniiiahkandclblb";
      }
    ];
  };
}