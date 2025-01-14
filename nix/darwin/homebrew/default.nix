#  Homebrew configuration.
#
#  flake.nix
#   └─ ./darwin
#       ├─ homebrew
#         ├─ default.nix *
#         └─ nix-homebrew.nix
#       ├─ modules
#       ├─ default.nix
#       ├─ configuration.nix
#
{
  inputs,
  lib,
  vars,
  config,
  ...
}: let
  inherit
    (inputs)
    homebrew-cask
    homebrew-core
    homebrew-bundle
    homebrew-services
    leoafarias-taps
    shivammathur-taps
    nix-homebrew
    ;
in {
  imports = [./nix-homebrew.nix];
  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = false;
    };

    brews = [
      "mysql"
      "fvm"
      "php@7.4"
      "composer"
    ];

    casks = [
      # Development Tools
      "homebrew/cask/docker"
      "visual-studio-code"
      "postman"

      # Communication Tools
      "microsoft-teams"
      "zalo"
      "discord"
      "telegram"
      "skype"

      # Entertainment Tools
      "iina"
      "jellyfin-media-player"

      # Productivity Tools
      "notion"
      "raycast"

      # Browsers
      "google-chrome"
      "arc"

      # Multimedia Tools
      "obs"

      # Utility Tools
      "logi-options+"
      "cloudflare-warp"
      "monitorcontrol"
      "openkey"
      "microsoft-auto-update"
    ];

    masApps = {
      "Xcode" = 497799835;
      "EZVIZ for Computer" = 1594552558;
    };
  };
  nix-homebrew = {
    enable = true;
    # Enable Rosetta for ARM Macs
    enableRosetta = true;
    # User owning the Homebrew prefix
    user = vars.user;
    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "homebrew/homebrew-services" = homebrew-services;
      "leoafarias/homebrew-fvm" = leoafarias-taps;
      "shivammathur/homebrew-php" = shivammathur-taps;
    };
    autoMigrate = true;
  };
}
