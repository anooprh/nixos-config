{ inputs, config, pkgs, lib, system, user, ... }:

{
  imports = [
    ./brave.nix
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    lynx # CLI based browser ; for TTY interfaces
  ];
}