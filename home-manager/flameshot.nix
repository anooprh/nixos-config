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
}