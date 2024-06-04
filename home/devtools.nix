{ inputs, config, pkgs, lib, ... }:

{
  home.file = {
    "Workspace/.keep".source = builtins.toFile "keep" ""; 
  };
  home.file = {
    "Tools/.keep".source = builtins.toFile "keep" ""; 
  };

  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.pycharm-community
    jetbrains.jdk
    jetbrains.idea-community
    jetbrains.goland
    jetbrains.clion
  ];
}