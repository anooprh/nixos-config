{ inputs, config, pkgs, lib, ... }:

{

  home.file = {
    "${config.xdg.userDirs.pictures}/Screenshots/.keep".source = builtins.toFile "keep" ""; 
  };

  # Screenshot tool
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showHelp = false;
        savePath = "${config.xdg.userDirs.pictures}/Screenshots";
        saveAsFileExtension = ".png";
      };
    };
  };

  
  home.packages = with pkgs; [
    # Radio Player
    tuner
    rhythmbox

    # VLC Media Player
    vlc

    # Krita - A free and open source painting application
    krita

    # Zoom - Video calls
    zoom-us
  ];

}