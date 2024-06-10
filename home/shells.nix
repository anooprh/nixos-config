{ inputs, config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        k = "kubectl"; 
        p = "cd ~/Workspace";
        pbcopy = "xsel --clipboard --input";
        pbpaste = "xsel --clipboard --output";
    };
    history.size = 1000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf"];
      theme = "robbyrussell";
    };
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}