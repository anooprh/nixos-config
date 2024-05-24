{
  description = "A very basic flake";

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
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs: 
  let 
    user = {
      name = "anoop";
      description = "Anoop Hallur";
    };
    hostname = "hpspectre";
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
        ./nixos/configuration.nix { _module.args = { inherit hostname baseVersion; };}
        ./nixos/users.nix { _module.args = { inherit user; };}

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
              ./home/${user.name}/desktopEnvironments
              ./home/${user.name}/browsers.nix
              ./home/${user.name}/git.nix
              ./home/${user.name}/shells.nix
              ./home/${user.name}/terminal-emulators.nix
              ./home/${user.name}/multimedia.nix
              ./home/${user.name}/documentutils.nix
              ./home/${user.name}/devtools.nix
              ./home/${user.name}/utils.nix
            ];
          };
        }
      ];
    };
  };
}
