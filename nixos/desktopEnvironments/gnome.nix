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
    gnome-menus
    gnome.gpaste
  ];

  services.dbus.packages = with pkgs; [ 
    gnome2.GConf
  ];

  # Profiling (with sysprof)
  services.sysprof.enable = true;

  # Automatic screen rotation
  hardware.sensor.iio.enable = true;

  stylix.image = ../../wallpapers/city_skyline_twilight_pixel.jpg;
  stylix.base16Scheme = {
    base00 = "282828";
    base01 = "3c3836";
    base02 = "504945";
    base03 = "665c54";
    base04 = "bdae93";
    base05 = "d5c4a1";
    base06 = "ebdbb2";
    base07 = "fbf1c7";
    base08 = "fb4934";
    base09 = "fe8019";
    base0A = "fabd2f";
    base0B = "b8bb26";
    base0C = "8ec07c";
    base0D = "83a598";
    base0E = "d3869b";
    base0F = "d65d0e";
  };

  # Adwait is installed by default
  # stylix.cursor.package = pkgs.apple-cursor; 
  stylix.cursor.name = "Adwaita";
 
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };
  stylix.polarity = "either"; # "light" or "either"
  stylix.fonts.sizes = {
    applications = 10;
    terminal = 10;
    desktop = 10;
    popups = 10;
  };
  stylix.targets.gnome.enable = true;
}
