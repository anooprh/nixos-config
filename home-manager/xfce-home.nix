{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
      iconTheme = {
      name = "elementary-Xfce-dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    theme = {
      name = "zukitre-dark";
      package = pkgs.zuki-themes;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;

  xfconf.settings = {
    xfce4-keyboard-shortcuts = {
      "commands/custom/<Alt>F2" = "xfce4-popup-whiskermenu";

      "xfwm4/custom/override" = true;
      "xfwm4/custom/<Super>Down" = "hide_window_key";
      "xfwm4/custom/<Super>Left" = "tile_left_key";
      "xfwm4/custom/<Super>Right" = "tile_right_key";
      "xfwm4/custom/<Super>Up" = "maximize_window_key";
    };
    xfce4-session = {
      "startup/ssh-agent/enabled" = false;
      "general/LockCommand" = "${pkgs.lightdm}/bin/dm-tool lock";
    }; 
    xfwm4 = {
      "general/workspace_count" = 4;
      "general/workspace_names" = [ "1" "2" "3" "4"];
    };

    xfce4-panel = {

      # example configurations:
      # https://github.com/vhminh/dotfiles/blob/7b7dd80408658f0d76f8d0b518a314f5952146ec/nix/modules/desktop.nix#L62
      # https://github.com/lobre/nix-home/blob/8117fbdb4bca887b875f622132b3b9e9c737a5bf/roles/hm/xfce/xfconf.nix#L144 -> leading slashes! :-O
      
      "panels" = [ 1 ];
      "panels/dark-mode" = true;
      "panels/panel-1/nrows" = 1; # number of rows
      "panels/panel-1/mode" = 0; # Horizontal
      "panels/panel-1/icon-size" = 0; # Adjust size automatically
      "panels/panel-1/size" = 26; # Row size (pixels)
      "panels/panel-1/length" = 100.0;
      "panels/panel-1/position" = "p=8;x=960;y=1066";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 ];
      
      # Launcher = whiskermenu
      "plugins/plugin-1" = "whiskermenu";
      "plugins/plugin-1/view-mode" = 0;
  
      # Application Menu
      "plugins/plugin-2" = "applicationsmenu";
      "plugins/plugin-2/show-button-title" = false;
  
      # Tasklist
      "plugins/plugin-3" = "tasklist";
      "plugins/plugin-3/grouping" = false;
      "plugins/plugin-3/sort-order" = 01; # Group title and timestamp
  
      # Separator
      "plugins/plugin-4" = "separator";
      "plugins/plugin-4/style" = 0; # transparent
      "plugins/plugin-4/expand" = true;
  
      # Workspaces
      "plugins/plugin-5" = "pager";
      "plugins/plugin-5/rows" = 1;
      "plugins/plugin-5/wrap-workspaces" = true;
      "plugins/plugin-5/numbering" = true;
      "plugins/plugin-5/workspace-scrolling" = false;
  
      # Separator
      "plugins/plugin-6" = "separator";
      "plugins/plugin-6/style" = 0; # transparent
  
      # Sys tray
      "plugins/plugin-7" = "systray";
      "plugins/plugin-7/icon-size" = 0;
  
      # clipboard
      "plugins/plugin-8" = "xfce4-clipman-plugin";
      "plugins/plugin-8/settings/save-on-quit" = true;
      "plugins/plugin-8/settings/max-texts-in-history" = 1000;
      "plugins/plugin-8/settings/add-primary-clipboard" = false;
  
      # Pulse audio
      "plugins/plugin-9" = "pulseaudio";
      "plugins/plugin-9/enable-keyboard-shortcuts" = true;
      "plugins/plugin-9/multimedia-keys-to-all" = true;
      "plugins/plugin-9/play-sound" = true;
      "plugins/plugin-9/show-notifications" = true;
  
      # Power manager
      "plugins/plugin-10" = "power-manager-plugin";
  
      # Notification
      "plugins/plugin-11" = "notification-plugin";
  
      # Separator
      "plugins/plugin-12" = "separator";
      "plugins/plugin-12/style" = 1; # non-transparent
  
      # Clock
      "plugins/plugin-13" = "clock";
      "plugins/plugin-13/digital-layout" = 3; # Time Only
      "plugins/plugin-13/digital-time-format" = "%A, %B %d, %Y   %H:%m:%S %P"; # Saturday, April 13, 2024   10:04:34
      "plugins/plugin-13/tooltip-format" = "%A %d %B %Y"; # Saturday 29 July 2023
      "plugins/plugin-13/mode" = 2; # digital
      "plugins/plugin-13/show-frame" = false;
  
      # Separator
      "plugins/plugin-14" = "separator";
      "plugins/plugin-14/style" = 1; # non-transparent
  
      # Actions 
      "plugins/plugin-15" = "actions";
      "plugins/plugin-15/appearance" = 0; # Show action buttons instead of name
      "plugins/plugin-15/ask-confirmation" = true;
  
    };
  };

  services.xcape = {
    enable = true;
    timeout = 500; # ms
    mapExpression = {
      # Map Windows (or Super) Key so that behaves as Alt+F2 when pressed and released
      # within the timeout. For Invoking whisker menu popup
      Super_L = "Alt_L|F2";
    };
  };

}
