{ inputs, config, pkgs, lib, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      config.enable_scroll_bar = true
      scrollback_lines = 20000;
    '';
  };
}