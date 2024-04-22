{ inputs, config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Ubuntu";
  };
}