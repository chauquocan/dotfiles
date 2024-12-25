_: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    casks = [
      # Development Tools
      # "homebrew/cask/docker"

      "wezterm"
      "swiftformat-for-xcode"

      # Communication Tools
      "microsoft-auto-update"
      "microsoft-teams"
      "libreoffice"

      # Entertainment Tools
      "iina"
      "jellyfin-media-player"

      # Productivity Tools
      "raycast"

      # Browsers
      "google-chrome"
      "arc"
      
      "logi-options+"
      "cloudflare-warp"
      "monitorcontrol"
      "openkey"
    ];
    taps = [
      "leoafarias/fvm"
      "shivammathur/php"
      "pkgxdev/made"
    ];
    brews = [
      "fvm"
      "mas"
      "pkgx"
      "cocoapods"
      "mysql"
      "php@7.4"
      "zsh-syntax-highlighting"
    ];
    masApps = {
      Xcode = 497799835;
      EZVIZ for Computer = 1594552558;
    };
  };
}
