{ inputs, config, pkgs, lib, user, ... }:

{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "${user.description}";
    userEmail = "${user.email}";
    ignores = [
      ".devenv"
      ".direnv"
      ".vscode/settings.json"
    ];
    extraConfig = {
      init.defaultBranch = "main";
    }
  };
  programs.gitui.enable = true;
  programs.gh.enable = true;
  programs.gh.settings.git_protocol = "ssh";

  home.packages = with pkgs; [
    gitg
    gitkraken
  ];
}