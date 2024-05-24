{ pkgs, ... }:

{
  # Enable Gnome
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  programs.dconf.enable = true;
  
  # Systray icons
  environment.systemPackages = with pkgs; [ 
    dconf
    gnomeExtensions.appindicator
    gnome.gnome-settings-daemon
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.gpaste
  ];

  services.dbus.packages = with pkgs; [ 
    gnome2.GConf
  ];

  # Profiling (with sysprof)
  services.sysprof.enable = true;

  # Automatic screen rotation
  hardware.sensor.iio.enable = true;
}
