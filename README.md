# NixOS Config

This is my personal config for setting up nix-os based linux systems. Currently this is very opinionated with very broad limitations. (for e.g works only for my user on a single machine). The purpose currently is to be able to recreate a reprodicible linux build with minimal effort. 

# Provisioning

## Prepare a NixOS Installer

Go to [NixOS Downloads](https://nixos.org/download/#) and install the latest NixOS distribution (23.11) at the time of writing this. Download an ISO image and mount it on a USB drive to make a bootable/live USB.

[Arch Wiki](https://wiki.archlinux.org/title/USB_flash_installation_medium) has a comprehensive documentation on how to create a bootable/live USB depending on your current Operating System. The instructions in the doc are for Arch Linux ISO, but are applicable to any flavour of linux. 

## TODO

- Setup impermanance
- Build Generic ISO
- Configure Vscode
- Setup per machine options
- Setup a profile for VM
- Configurable to gnome/kde/xfce
