{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      blueman
      deja-dup
      drawing
      elementary-xfce-icon-theme
      evince
      foliate
      font-manager
      # gimp-with-plugins
      gnome.file-roller
      gnome.gnome-disk-utility
      inkscape-with-extensions
      libqalculate
      libreoffice
      orca
      pavucontrol
      qalculate-gtk
      thunderbird
      wmctrl
      xclip
      xcolor
      xdo
      xdotool
      xfce.catfish
      xfce.gigolo
      xfce.orage
      xfce.xfburn
      xfce.xfconf
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-dockbarx-plugin
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-mpc-plugin
      #xfce.xfce4-namebar-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-power-manager
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-timer-plugin
      xfce.xfce4-volumed-pulse
      xfce.xfce4-windowck-plugin
      xfce.xfce4-weather-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      xsel
      xtitle
      xwinmosaic
      skippy-xd

      # Themes, Cursors, Icons (Look and Feel)
      whitesur-gtk-theme
      zuki-themes
      whitesur-cursors
      whitesur-icon-theme
      nordzy-icon-theme
    ];
  };


  programs = {
    xfconf.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "WhiteSur-Light-solid";
          };
        };
      };
      desktopManager.xfce.enable = true;
    };
  };

  sound.enable = true;
}