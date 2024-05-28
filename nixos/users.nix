# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, user, ... }:

{

  services = {
  #   Disable automatic login.
  #   displayManager.autoLogin.user = "${user.name}";
      displayManager.autoLogin.enable = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user.name} = {
    isNormalUser = true;
    description = "${user.description}";
    extraGroups = [ "networkmanager" "wheel" "audio" "vboxusers" "docker" ];
    shell = pkgs.zsh;
  };

  users.extraGroups.vboxusers.members = [ "${user.name}" ];
}
