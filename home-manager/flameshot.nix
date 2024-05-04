{ inputs, config, pkgs, lib, ... }:

{

  home.file = {
    "${config.xdg.userDirs.pictures}/Screenshots" = {
        source = builtins.toFile "keep" "";
        recursive = true;
    };
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