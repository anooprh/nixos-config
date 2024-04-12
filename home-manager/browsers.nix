{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ## Browsers
    google-chrome
    brave
    firefox
  ];

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

  programs.firefox = {
    enable = true;
    profiles.anoop = {

      bookmarks = [
        {
          name = "wikipedia";
          tags = [ "wiki" ];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
      ];

      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      userChrome = ''                         
        /* some css */                        
      '';                                      

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        don-t-fuck-with-paste
      ];
    };
  };

}