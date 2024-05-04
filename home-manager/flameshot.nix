{ inputs, config, pkgs, lib, ... }:

{

  home.file = {
    "${config.xdg.userDirs.pictures}/Screenshots" = {
        source = builtins.toFile ".keep" "";
    };
  };

  # Screenshot tool
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        uiColor = my.palette."65";
        contrastUiColor = my.palette."68";
        showHelp = false;
        savePath = "${config.xdg.userDirs.pictures}/Screenshots";
        saveAsFileExtension = ".png";
      };
    };
  };
}