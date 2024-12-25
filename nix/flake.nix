{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    darwin,
  } @ inputs: let
    commonConfigs = {
      imports = [
        ./modules/common
      ];
    };

    darwinConfigs = {
      imports = [
        ./modules/darwin
      ];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = inputs;
      home-manager.users.quocan = import ./home.nix;
      nixpkgs.config.allowUnfree = true;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;
    };
    raspConfigs = {
      import = [
        ./modules/rasp.nix
      ];
    };
  in {
    darwinConfigurations.quocan = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {inherit inputs;};
      modules = [
        darwinConfigs
        commonConfigs
        home-manager.darwinModules.home-manager
      ];
    };

    nixosConfigurations.rasp = {
      system = "armv7l-linux";
      user = "quocan";
      modules = [
        commonConfigs
        raspConfigs
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
