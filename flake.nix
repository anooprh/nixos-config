{
  description = "System Flake";
  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let 
    user = {
      name = "anoop";
      description = "Anoop Hallur";
      email = "anoophallur@gmail.com";
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
          home-manager.extraSpecialArgs = { inherit inputs user system; };
          home-manager.users.${user.name} = {
            home.username = "${user.name}";
            home.homeDirectory = "/home/${user.name}";
            home.stateVersion = "${baseVersion}";
            programs.home-manager.enable = true;
            imports = [
              ./home/browsers
              ./home/devtools.nix
              ./home/docker.nix
              ./home/documentutils.nix
              ./home/git.nix
              ./home/multimedia.nix
              ./home/shells.nix
              ./home/terminator.nix
              ./home/utils.nix
              ./home/vscode.nix
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
  };
}
