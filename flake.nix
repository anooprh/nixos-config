{
  description = "System Flake";
  outputs = { self, nixpkgs, home-manager, plasma-manager, stylix, ... }@inputs: 
  let 
    user = {
      name = "anoop";
      description = "Anoop Hallur";
      email = "anoophallur@gmail.com";
    };
    hostname = "hpspectre";
    dekstopEnv = "gnome" ;# Set to one of "gnome", "xfce", "kde"
    system = "x86_64-linux";
    baseVersion = "23.11";
  in
  {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./machines/${hostname}/hardware-configuration.nix
        ./nixos/configuration.nix { _module.args = { inherit hostname baseVersion dekstopEnv; };}
        ./nixos/users.nix { _module.args = { inherit user; };}
        stylix.nixosModules.stylix

  	    # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          home-manager.extraSpecialArgs = { inherit inputs user; };
          home-manager.users.${user.name} = {
            home.username = "${user.name}";
            home.homeDirectory = "/home/${user.name}";
            home.stateVersion = "${baseVersion}";
            programs.home-manager.enable = true;
            imports = [
              ./home/desktopEnvironments
              ./home/browsers.nix
              ./home/git.nix
              ./home/shells.nix
              ./home/terminal-emulators.nix
              ./home/multimedia.nix
              ./home/documentutils.nix
              ./home/devtools.nix
              ./home/utils.nix
            ];
          };
        }
      ];
    };
  };
  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };   
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

}
