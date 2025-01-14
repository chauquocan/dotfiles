#
#  These are the different profiles that can be used when building on MacOS
#
#  flake.nix
#   └─ ./darwin
#       ├─ homebrew
#       ├─ default.nix *
#       ├─ configuration.nix
#       └─ <host>.nix
#
{
  inputs,
  nixpkgs,
  darwin,
  home-manager,
  nixvim,
  homebrew-core,
  homebrew-cask,
  homebrew-bundle,
  homebrew-services,
  leoafarias-taps,
  shivammathur-taps,
  android-nixpkgs,
  vars,
  ...
}: let
  systemConfig = system: {
    system = system;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
in {
  # MacBook Pro M4 14" (2024)
  MacBookProM4 = let
    inherit (systemConfig "aarch64-darwin") system pkgs;
  in
    darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit inputs system pkgs vars android-nixpkgs;};
      modules = [
        ./configuration.nix
        ./m4.nix
        ./homebrew
        nixvim.nixDarwinModules.nixvim
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
}
