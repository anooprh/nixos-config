# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  services.xserver = {
    displayManager.autoLogin.user = "anoop";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anoop = {
    isNormalUser = true;
    description = "Anoop Hallur";
    extraGroups = [ "networkmanager" "wheel" "audio" "vboxusers" ];
    shell = pkgs.zsh;
  };

  users.extraGroups.vboxusers.members = [ "anoop" ];
}
