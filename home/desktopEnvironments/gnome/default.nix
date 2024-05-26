{ inputs, config, pkgs, lib, ... }:

{
  
  # gtk = {
  #   enable = true;

  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };

  #   theme = {
  #     name = "palenight";
  #     package = pkgs.palenight-theme;
  #   };

  #   cursorTheme = {
  #     name = "Numix-Cursor";
  #     package = pkgs.numix-cursor-theme;
  #   };

  #   gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=0
  #     '';
  #   };

  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=0
  #     '';
  #   };
  # };
  stylix.image = ./wallpapers/city_skyline_twilight_pixel.jpg;


  dconf.settings = {
   "org/gnome/desktop/interface" = {
      color-scheme = "default";
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
        "appmenu-is-back@fthx"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        # "espresso@coadmunkee.github.com"
        "peek-top-bar-on-fullscreen@marcinjahn.com"
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        #"blur-my-shell@aunetx"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "palenight";
    # };
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
      dynamic-workspaces = false;
      workspaces-only-on-primary = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
  };

  home.packages = with pkgs; [
    palenight-theme
    gnomeExtensions.vitals
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.applications-menu
    gnomeExtensions.auto-move-windows
    gnomeExtensions.user-themes
    gnomeExtensions.espresso
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.peek-top-bar-on-fullscreen
    gnomeExtensions.top-bar-organizer
    gnomeExtensions.screenshot-tool
  ];
}