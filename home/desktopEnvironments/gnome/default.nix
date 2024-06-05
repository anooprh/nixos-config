{ inputs, config, pkgs, lib, ... }:

{

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>space";
      command = "rofi -show drun";
      name = "Rofi App Launcher";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };  
    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [];
      switch-input-source-backward = [];
    };

    # Set Num Lock On by default
    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };
    "org/gnome/desktop/interface" = {
      icon-theme = "Adwaita";
      enable-hot-corners = false;
      clock-format = "12h";
      clock-show-weekday = true;
      clock-show-seconds = true;
      show-battery-percentage = true;
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
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        # "Vitals@CoreCoding.com"
        # "Bluetooth-Battery-Meter@maniacx.github.com"
        "app-menu-is-back@fthx"
        "appindicatorsupport@rgcjonas.gmail.com"
        # "apps-menu@gnome-shell-extensions.gcampax.github.com"
        # "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        # "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        # "peek-top-bar-on-fullscreen@marcinjahn.com"
        "unite@hardpixel.eu"
        "dock-from-dash@fthx"
        # "just-perfection-desktop@just-perfection"
        # "system-monitor@gnome-shell-extensions.gcampax.github.com"
        # "clipboard-indicator@tudmotu.com"
        "compiz-alike-magic-lamp-effect@hermes83.github.com"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "palenight";
    # };
    # "org/gnome/shell/extensions/just-perfection" = {
    #   panel-in-overview = true;
    # };
    # "org/gnome/shell/extensions/vitals" = {
    #   hide-zeros = true;
    #   network-speed-format = 1; # bits/second
    # };
    "org/gnome/shell/extensions/unite" = {
      show-window-title = "never";
      show-window-buttons = "always";
      show-appmenu-button = false;
      hide-activities-button = "never";
      use-activities-text = false;
      window-buttons-placement = "last";
    };
    # "org/gnome/shell/extensions/Bluetooth-Battery-Mete" = {
    #   enable-battery-level-text = true;
    #   Swap-icon-text = true;
    # };
  };

  home.packages = with pkgs; [
    dconf2nix
    # gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.appindicator
    # gnomeExtensions.auto-move-windows
    gnomeExtensions.caffeine
    # gnomeExtensions.peek-top-bar-on-fullscreen
    # gnomeExtensions.top-bar-organizer
    # gnomeExtensions.screenshot-tool
    gnomeExtensions.unite
    # gnomeExtensions.date-menu-formatter
    # gnomeExtensions.just-perfection
    gnomeExtensions.dock-from-dash
    # gnomeExtensions.clipboard-indicator
    gnomeExtensions.compiz-alike-magic-lamp-effect
  ];

  stylix.targets.vscode.enable = false;

}
