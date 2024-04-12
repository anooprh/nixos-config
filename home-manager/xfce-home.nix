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
      "commands/custom/<Alt>F3" = "xfce4-popup-whiskermenu";

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
      "general/workspace_count" = 3;
      "general/workspace_names" = [ "1" "2" "3"];
    }
  };

  services.xcape = {
    enable = true;
    timeout = 500; # ms
    mapExpression = {
      # Map Windows (or Super) Key so that behaves as Alt+F3 when pressed and released
      # within the timeout. For Invoking whisker menu popup
      Super_L = "Alt_L|F3";
    };
  };

}
