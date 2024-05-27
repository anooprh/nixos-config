{ inputs, config, pkgs, lib, ... }:

{

  dconf.settings = {
   "org/gnome/desktop/interface" = {
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
        "Vitals@CoreCoding.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        # "appmenu-is-back@fthx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        # "espresso@coadmunkee.github.com"
        "peek-top-bar-on-fullscreen@marcinjahn.com"
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        #"blur-my-shell@aunetx"
        "unite@hardpixel.eu"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "palenight";
    # };
    "org/gnome/shell/extensions/vitals" = {
      hide-zeros = true;
      network-speed-format = 1; # bits/second
    };
    "org/gnome/shell/extensions/unite" = {
      show-window-title = "never";
      hide-activities-button = "never";
      use-activities-text = false;
      window-buttons-placement = "last";
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
      dynamic-workspaces = false;
      workspaces-only-on-primary = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };

  home.packages = with pkgs; [
    palenight-theme
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
  ];

  # stylix.targets.gnome.enable = false;
  stylix.targets.vscode.enable = false;

}