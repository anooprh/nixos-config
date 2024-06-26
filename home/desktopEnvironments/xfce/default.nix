{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-Light";
      package = pkgs.whitesur-icon-theme;
    };
    theme = {
      name = "WhiteSur-Light";
      package = pkgs.whitesur-gtk-theme;
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

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;

  xfconf.settings = {
    # Keyboard shortcuts probably has a bug settings via xfconf. Setting it directly via xml
       xfce4-session = {
      "startup/ssh-agent/enabled" = false;
      "general/LockCommand" = "${pkgs.lightdm}/bin/dm-tool lock";
    }; 
    xfwm4 = {
      "general/workspace_count" = 5;
      "general/workspace_names" = [ "Gen" "Dev" "Chat" "VM's" "Read"];
      "general/theme" = "WhiteSur-Light";
      "general/snap_to_windows" = true;
      "general/activate_action" = "switch";
      "general/wrap_cycle" = true; # cycle to first workspace after last
      "general/cycle_draw_frame" = false; # no blue frame when cycling with alt-tab
      "general/cycle_preview" = false; # hide thumbnails when cycling with alt-tab
      "general/cycle_tabwin_mode" = 0; # don’t cycle through windows in a list
      "general/wrap_windows" = true; # move window to other workspace when approaching border
      "general/wrap_workspaces" = false; # dont move cursor to other workspace when approaching border
    };
    xfce4-panel = {      
      "panels" = [ 1 ];
      "panels/dark-mode" = false;
      "panels/panel-1/nrows" = 1; # number of rows
      "panels/panel-1/mode" = 0; # Horizontal
      "panels/panel-1/icon-size" = 0; # Adjust size automatically
      "panels/panel-1/size" = 26; # Row size (pixels)
      "panels/panel-1/length" = 100.0;
      "panels/panel-1/position" = "p=6;x=960;y=13";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
      
      # Launcher = whiskermenu
      "plugins/plugin-1" = "whiskermenu";
      "plugins/plugin-1/view-mode" = 0;
      "plugins/plugin-1/menu-width" = 1920; # Occupy full screen on 1920x1080
      "plugins/plugin-1/menu-height" = 1054;
      "plugins/plugin-1/default-category" = 1;
      "plugins/plugin-1/recent-items-max" = 20;
      "plugins/plugin-1/favorites-in-recent" = true;
      "plugins/plugin-1/category-icon-size" = 3;
      "plugins/plugin-1/position-categories-horizontal" = false;
      "plugins/plugin-1/position-categories-alternate" = true;
      "plugins/plugin-1/position-commands-alternate" = true;
      "plugins/plugin-1/position-search-alternate" = false;
      "plugins/plugin-1/profile-shape" = 2;
      "plugins/plugin-1/show-button-icon" = true;
      "plugins/plugin-1/show-button-title" = false;
  
      # Application Menu
      "plugins/plugin-2" = "applicationsmenu";
      "plugins/plugin-2/show-button-title" = false;

      # Tasklist
      "plugins/plugin-3" = "tasklist";
      "plugins/plugin-3/flat-buttons" = true;
      "plugins/plugin-3/show-labels" = false;
      "plugins/plugin-3/show-handle" = true;
      "plugins/plugin-3/show-tooltips" =  true;
      "plugins/plugin-3/grouping" = true;

      # Separator
      "plugins/plugin-4" = "separator";
      "plugins/plugin-4/style" = 3; # handle

      # Window Menu
      "plugins/plugin-5" = "windowmenu";
      "plugins/plugin-5/workspace-actions" = true;
      "plugins/plugin-5/style" = 1; # Show button instead of Application Icon


      # Workspaces
      "plugins/plugin-6" = "pager";
      "plugins/plugin-6/rows" = 1;
      "plugins/plugin-6/wrap-workspaces" = true;
      "plugins/plugin-6/numbering" = false;
      "plugins/plugin-6/miniature-view" = false;
      "plugins/plugin-6/workspace-scrolling" = false;

      # Windock Menu Plugin
      "plugins/plugin-7" = "wckmenu-plugin";

      # Windock Plugin
      "plugins/plugin-8" = "windowck-plugin";

      # Separator
      "plugins/plugin-9" = "separator";
      "plugins/plugin-9/style" = 0; # transparent
      "plugins/plugin-9/expand" = true;

      # Window Buttons
      "plugins/plugin-10" = "wckbuttons";
   
      # Separator
      "plugins/plugin-11" = "separator";
      "plugins/plugin-11/style" = 0; # transparent
  
      # Sys tray
      "plugins/plugin-12" = "systray";
      "plugins/plugin-12/icon-size" = 0;
  
      # clipboard
      "plugins/plugin-13" = "xfce4-clipman-plugin";
      "plugins/plugin-13/settings/save-on-quit" = true;
      "plugins/plugin-13/settings/max-texts-in-history" = 1000;
      "plugins/plugin-13/settings/add-primary-clipboard" = false;
  
      # Pulse audio
      "plugins/plugin-14" = "pulseaudio";
      "plugins/plugin-14/enable-keyboard-shortcuts" = true;
      "plugins/plugin-14/multimedia-keys-to-all" = true;
      "plugins/plugin-14/play-sound" = true;
      "plugins/plugin-14/show-notifications" = true;
  
      # Power manager
      "plugins/plugin-15" = "power-manager-plugin";
  
      # Notification
      "plugins/plugin-16" = "notification-plugin";
  
      # Separator
      "plugins/plugin-17" = "separator";
      "plugins/plugin-17/style" = 1; # non-transparent
  
      # Clock
      "plugins/plugin-18" = "clock";
      "plugins/plugin-18/digital-layout" = 3; # Time Only
      "plugins/plugin-18/digital-time-font" = "Sans Bold 9";
      "plugins/plugin-18/digital-time-format" = "%A, %B %d, %Y   %I:%M:%S %P"; # Saturday, April 13, 2024   10:04:34
      "plugins/plugin-18/tooltip-format" = "%A %d %B %Y"; # Saturday 29 July 2023
      "plugins/plugin-18/mode" = 2; # digital
      "plugins/plugin-18/show-frame" = false;
  
      # Separator
      "plugins/plugin-19" = "separator";
      "plugins/plugin-19/style" = 1; # non-transparent
  
      # Show Dekstop 
      "plugins/plugin-20" = "showdesktop";  
    };
    xfce4-appfinder = {
      "hide-window-decorations" = false;
      "always-center" = true;
      "sort-by-frecency" = true;
      "remember-category" = true;
    };
    xsettings = {
      "Net/ThemeName" = "WhiteSur-Light";
      "Net/IconThemeName" = "WhiteSur-Dark";
    };
    xfdashboard = {
      "theme" = "xfdashboard-mint";
      "reset-search-on-resume" = true;
      "enable-animations" = false;
      "windows-view/scroll-event-changes/workspace" = true;
      "applications-view/show-all-apps" = true;
    };
  };

  home.file = {
    ".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" = {
        source = ./xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml;
    };
    #".config/xfce4/xfconf/xfce-perchannel-xml/displays.xml" = {
    #    source = ./xfconf/xfce-perchannel-xml/displays.xml;
    #};
    ".config/xfce4/helpers.rc" = {
        source = ./helpers.rc;
    };
    ".config/gtk-3.0/gtk.css" = {
        source = ./gtk.css;
    };
  };
}
