{ inputs, config, pkgs, lib, user, ... }:

{
  programs.rofi = {
    enable = true;
    cycle = true;
    theme = lib.mkForce ./rofi-arthur.rasi;
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "󱄅  ";
    };
  };
}
