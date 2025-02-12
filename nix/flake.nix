{
  description = "Quoc An's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-services = {
      url = "github:homebrew/homebrew-services";
      flake = false;
    };

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    leoafarias-taps = {
      url = "github:leoafarias/homebrew-fvm";
      flake = false;
    };

    shivammathur-taps = {
      url = "github:shivammathur/homebrew-php";
      flake = false;
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    darwin,
    nixpkgs,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    homebrew-bundle,
    homebrew-services,
    home-manager,
    nixvim,
    leoafarias-taps,
    shivammathur-taps,
    android-nixpkgs,
  }: let
    # Variables Used In Flake
    vars = {
      user = "quocan";
      location = "$HOME/";
      terminal = "wezterm";
      editor = "nvim";
    };
  in {
    darwinConfigurations = (
      import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs darwin vars home-manager nixvim homebrew-core homebrew-cask homebrew-bundle homebrew-services leoafarias-taps shivammathur-taps nix-homebrew android-nixpkgs;
      }
    );
  };
}
