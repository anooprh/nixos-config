{ inputs, config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        p = "cd ~/Workspace";
        t = "cd ~/Tools";
        pbcopy = "xsel --clipboard --input";
        pbpaste = "xsel --clipboard --output";
    };
    history.size = 1000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" "git-prompt" "zsh-interactive-cd" ];
      theme = "robbyrussell";
    };
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}