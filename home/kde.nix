{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    libsForQt5.polonium
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    windows.allowWindowsToRememberPositions = true;

    panels = [
      {
        location = "top";
        height = 30;
        floating = false;
        widgets = [
          "org.kde.plasma.kickoff"
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:systemsettings.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:terminator.desktop"
                "applications:brave-browser.desktop"
                "applications:code.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
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
            systemTray.items = {
              # Explicitly show these items
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.mediacontroller"
                "org.kde.kscreen"
              ];
              # Explicitly hide these items
              hidden = [
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "12h";
              time.showSeconds = "always";
              date.position = "besideTime";
              date.format = {
                "custom" = "ddd d MMM";
              };
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
    shortcuts = {
      "services/org.flameshot.Flameshot.desktop" = {
        "Capture" = "Print";
      };
    };
    
    configFile = {
      # Show Krunner in the Center with Auto Completion
      "krunnerrc"."General"."FreeFloating" = true;
      "krunnerrc"."General"."historyBehavior" = "ImmediateCompletion";

      # Enable numlock on login
      "kcminputrc"."Keyboard"."NumLock"."value" = 0;
    };
  };
}