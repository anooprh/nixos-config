{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.pycharm-community
    jetbrains.jdk
    jetbrains.idea-community
    jetbrains.goland
    jetbrains.clion
  ];
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
  };
}