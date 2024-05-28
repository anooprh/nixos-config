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

   imports = [
    # Source: https://gist.github.com/piousdeer/b29c272eaeba398b864da6abf6cb5daa
    # Make vscode settings writable

    (import (builtins.fetchurl {
      url = "https://gist.githubusercontent.com/piousdeer/b29c272eaeba398b864da6abf6cb5daa/raw/41e569ba110eb6ebbb463a6b1f5d9fe4f9e82375/mutability.nix";
      sha256 = "4b5ca670c1ac865927e98ac5bf5c131eca46cc20abf0bd0612db955bfc979de8";
    }) { inherit config lib; })

    (import (builtins.fetchurl {
      url = "https://gist.githubusercontent.com/piousdeer/b29c272eaeba398b864da6abf6cb5daa/raw/41e569ba110eb6ebbb463a6b1f5d9fe4f9e82375/vscode.nix";
      sha256 = "fed877fa1eefd94bc4806641cea87138df78a47af89c7818ac5e76ebacbd025f";
    }) { inherit config lib pkgs; })
  ];
  
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      eamodio.gitlens
      ms-azuretools.vscode-docker
      humao.rest-client
      johnpapa.vscode-peacock
      aaron-bond.better-comments
      donjayamanne.githistory
      file-icons.file-icons
    ];
    mutableExtensionsDir = true;
    userSettings = {
      "files.autoSave" = "on";
      "[nix]"."editor.tabSize" = 2;
    };
  };
}