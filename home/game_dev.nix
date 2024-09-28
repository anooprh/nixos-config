{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    godot_4
  ];
}