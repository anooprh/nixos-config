{ inputs, config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    jetbrains-mono
  ];

  programs.terminator = { 
    enable = true;
    config = {
      profiles.default.use_system_font = false;
      profiles.default.scrollback_infinite = true;
      profiles.default.audible_bell = true;
      profiles.default.visible_bell = true;
      profiles.default.urgent_bell = true;
      profiles.default.cursor_shape = "ibeam";
      profiles.default.font = "JetBrains Mono 11";
    };
  };
}