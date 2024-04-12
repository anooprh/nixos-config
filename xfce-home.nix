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
      "/commands/custom/<Super>x" = "xfce4-popup-whiskermenu";
    };
    xfce4-session = {
      "startup/ssh-agent/enabled" = false;
      "general/LockCommand" = "${pkgs.lightdm}/bin/dm-tool lock";
    };
  };
}
