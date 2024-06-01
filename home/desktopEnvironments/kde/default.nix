{ inputs, config, pkgs, lib, ... }:

{
  
  home.packages = with pkgs; [
#    latte-dock
#    libsForQt5.applet-window-buttons
#    libsForQt5.applet-window-appmenu
  ];

  home.file = {
    "${config.xdg.dataHome}/plasma/plasmoids" = {
      source = ./plasma/plasmoids;
      recursive = true;
    };
    "${config.xdg.dataHome}/kwin/scripts" = {
      source = ./kwin/scripts;
      recursive = true;
    };
  };

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
        clickItemTo = "select";
        lookAndFeel = "org.kde.breeze.desktop";
        cursorTheme = "breeze";
        iconTheme = "breeze";
        # wallpaper = "${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
        wallpaper = ../../../wallpapers/milk-bear-mocha.jpg;
    };

   panels = [
     # Windows-like panel at the bottom
     # {
     #    location = "bottom";
     #    lengthMode = "fit";
     #    height = 64;
     #    widgets = [
     #      {
     #        name = "org.kde.plasma.icontasks";
     #        config = {
     #          General.launchers = [
     #            "applications:org.kde.dolphin.desktop"
     #            "applications:org.kde.konsole.desktop"
     #          ];
     #        };
     #      }
     #    ];
     #    hiding = "autohide";
     # }
   
     # Global menu at the top
     {
      location = "top";
      height = 26;
      widgets = [
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General.icon = "nix-snowflake";
          };
        }
        "org.kde.plasma.marginsseparator"
        { 
          name = "com.github.antroids.application-title-bar";
          config = {
              Appearance.widgetButtonsIconsTheme = "Aurorae";
              Appearance.windowTitleFontSizeMode = "Fit";
              Appearance.windowTitleMarginsLeft = "20";
              Appearance.windowTitleMarginsRight = "20";
              Appearance.windowTitleSource = "AppName";
              Appearance.windowTitleUndefined = "";
          };
        }
        "org.kde.plasma.appmenu"

        "org.kde.plasma.panelspacer"

        {
          name = "org.kde.plasma.weather";
          config = {
            WeatherStation.source = "bbcukmet|weather|Hyderabad, India, IN|1269843";
            Appearance.showTemperatureInCompactMode = "true";
          };
        }
        "org.kde.plasma.marginsseparator"
        {
          name = "org.kde.plasma.systemtray";  
        }
        {
          digitalClock = {
            calendar.firstDayOfWeek = "monday";
            time.format = "12h";
            time.showSeconds = "always";
            date.position = "besideTime";
            date.format = {
              "custom" = "dddd dd MMMM yyyy";
            };
          };
        }
        "org.kde.plasma.showdesktop"
      ];
     }
   ];
  };
}