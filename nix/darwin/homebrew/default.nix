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
      "cursor"
      "postman"

      # Communication Tools
      "microsoft-teams"
      "zalo"
      "discord"
      "telegram"

      # Entertainment Tools
      "iina"
      "jellyfin-media-player"
      "steam"

      # Productivity Tools
      "notion"
      "raycast"
      "the-unarchiver"

      # Browsers
      "google-chrome"
      "arc"
      # "firefox"

      # Multimedia Tools
      "obs"

      # Utility Tools
      "logi-options+"
      "cloudflare-warp"
      "monitorcontrol"
      "openkey"
      "microsoft-auto-update"
      # "lm-studio"
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
