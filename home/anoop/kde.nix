{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
   kdePackages.kdeconnect-kde
  ];

 programs.plasma = {
   enable = true;
#   workspace = {
#    clickItemTo = "select";
#    lookAndFeel = "org.kde.breezedark.desktop";
#    cursorTheme = "Breeze_Snow";
#    iconTheme = "Papirus";
#    wallpaper = "${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
#  };

  panels = [
    # Windows-like panel at the bottom
    {
      location = "bottom";
      widgets = [
        # We can configure the widgets by adding the name and config
        # attributes. For example to add the the kickoff widget and set the
        # icon to "nix-snowflake-white" use the below configuration. This will
        # add the "icon" key to the "General" group for the widget in
        # ~/.config/plasma-org.kde.plasma.desktop-appletsrc.
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General.icon = "nix-snowflake-white";
          };
        }
        # Adding configuration to the widgets can also for example be used to
        # pin apps to the task-manager, which this example illustrates by
        # pinning dolphin and konsole to the task-manager by default.
        {
          name = "org.kde.plasma.icontasks";
          config = {
            General.launchers = [
              "applications:org.kde.dolphin.desktop"
              "applications:org.kde.konsole.desktop"
            ];
          };
        }
        # If no configuration is needed, specifying only the name of the
        # widget will add them with the default configuration.
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.systemtray"
        # If you need configuration for your widget, instead of specifying the
        # the keys and values directly using the config attribute as shown
        # above, plasma-manager also provides some higher-level interfaces for
        # configuring the widgets. See modules/widgets for supported widgets
        # and options for these widgets. The widget below shows an example of
        # usage, where we add a digital clock, setting 12h time and first day
        # of the week to sunday.
        {
          digitalClock = {
            calendar.firstDayOfWeek = "monday";
            time.format = "12h";
          };
        }
      ];
      hiding = "autohide";
    }
    
    # Global menu at the top
    {
      location = "top";
      height = 26;
      widgets = [
        "org.kde.plasma.appmenu"
      ];
    }
  ];
 };
}