{ inputs, config, pkgs, lib, ... }:

{

  dconf.settings = {
   "org/gnome/desktop/interface" = {
      icon-theme = "Adwaita";
      enable-hot-corners = false;
      clock-format = "12h";
      clock-show-weekday = true;
      clock-show-seconds = true;
      show-battery-percentage = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        # "Vitals@CoreCoding.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "appmenu-is-back@fthx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        # "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        # "espresso@coadmunkee.github.com"
        "peek-top-bar-on-fullscreen@marcinjahn.com"
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        # "blur-my-shell@aunetx"
        "unite@hardpixel.eu"
        "dock-from-dash@fthx"
        "just-perfection-desktop@just-perfection"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        # "date-menu-formatter@marcinjakubowski.github.com"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "palenight";
    # };
    "org/gnome/shell/extensions/just-perfection" = {
      panel-in-overview = true;
    };
    "org/gnome/shell/extensions/vitals" = {
      hide-zeros = true;
      network-speed-format = 1; # bits/second
    };
    "org/gnome/shell/extensions/unite" = {
      show-window-title = "never";
      show-appmenu-button = false;
      hide-activities-button = "never";
      use-activities-text = false;
      window-buttons-placement = "last";
    };
    "org/gnome/shell/extensions/Bluetooth-Battery-Mete" = {
      enable-battery-level-text = true;
      Swap-icon-text = true;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
      night-light-schedule-automatic = false;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };

  home.packages = with pkgs; [
    dconf2nix
    gnomeExtensions.vitals
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.auto-move-windows
    gnomeExtensions.user-themes
    gnomeExtensions.caffeine
    gnomeExtensions.peek-top-bar-on-fullscreen
    gnomeExtensions.top-bar-organizer
    gnomeExtensions.screenshot-tool
    gnomeExtensions.unite
    gnomeExtensions.date-menu-formatter
    gnomeExtensions.just-perfection
    gnomeExtensions.dock-from-dash
  ];

  stylix.targets.vscode.enable = false;
  stylix.targets.gtk.extraCss = ''
  '';

}