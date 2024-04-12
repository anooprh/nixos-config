{ inputs, config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        k = "kubectl";    
    };
    history.size = 1000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  #programs.bash = {
  #  enable = true;
  #  enableCompletion = true;
  #  # TODO add your custom bashrc here
  #  bashrcExtra = ''
  #    export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #  '';

  #  # set some aliases, feel free to add more or remove some
  #  shellAliases = {
  #    k = "kubectl";
  #    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
  #    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  #  };
  #};

  ## starship - an customizable prompt for any shell
  #programs.starship = {
  #  enable = true;
  #  # custom settings
  #  settings = {
  #    add_newline = false;
  #    aws.disabled = true;
  #    gcloud.disabled = true;
  #    line_break.disabled = true;
  #  };
  #};
}