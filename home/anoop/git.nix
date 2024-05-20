{ inputs, config, pkgs, lib, ... }:

{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Anoop Hallur";
    userEmail = "anoophallur.com";
  };
}