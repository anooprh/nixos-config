{ inputs, config, pkgs, lib, ... }:

{
  
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=0
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=0
      '';
    };
  };

  dconf.settings = {
   "org/gnome/desktop/interface" = {
      color-scheme = "default";
      enable-hot-corners = false;
      clock-format = "12h";
      clock-show-weekday = true;
      clock-show-seconds = true;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        "Vitals@CoreCoding.com"
        "sound-output-device-chooser@kgshank.net"
        "applications-menu"
        "app-menu-is-back"
        "arcmenu"
        "window-title-is-back"
        "bluetooth-battery-meter"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "palenight";
    };
    "org/gnome/shell/extensions/vitals" = {
      hide-zeros = true;
      network-speed-format = 1; # bits/second
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
  };

  home.packages = with pkgs; [
    palenight-theme
    gnomeExtensions.vitals
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.applications-menu
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.arcmenu
    gnomeExtensions.window-title-is-back
    gnomeExtensions.bluetooth-battery-meter
  ];
}