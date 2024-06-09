{ inputs, config, pkgs, lib, system, user, ... }:

{
  home.packages = with pkgs; [
    ## Browsers
    google-chrome
    brave
    firefox
  ];

  programs.firefox = {
    enable = true;
    profiles.${user.name} = {
      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      userChrome = ''                         
        /* some css */                        
      '';                                      

      extensions = with inputs.firefox-addons.packages."${system}"; [
        bitwarden
        don-t-fuck-with-paste
      ];
    };
  };

}