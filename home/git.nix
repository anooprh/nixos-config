{ inputs, config, pkgs, lib, user, ... }:

{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "${user.description}";
    userEmail = "${user.email}";
    ignores = [
      ".devenv"
    ];
  };
}