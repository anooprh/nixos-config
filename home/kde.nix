{ inputs, config, pkgs, lib, ... }:

{

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    panels = [
      {
        location = "top";
        height = 36;
        widgets = [
          "org.kde.plasma.kickoff"
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
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
              date.position = "adaptive";
              date.format = {
                "custom" = "dddd dd MMMM yyyy";
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
  };
}