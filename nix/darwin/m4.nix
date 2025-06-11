#
#  Specific system configuration settings for MacBook Pro M4 14" (2024)
#
#  flake.nix
#   └─ ./darwin
#       ├─ homebrew
#       ├─ modules
#       ├─ configuration.nix
#       ├─ default.nix
#       └─ ./m4.nix *
#
{
  pkgs,
  vars,
  android-nixpkgs,
  ...
}: {
  imports = import ./modules;

  # aerospace.enable = true;

  environment = {
    systemPackages = with pkgs; [
      wezterm
      neovim
      mkalias
      tmux
      bat
      fzf
      lazygit
      alejandra
      btop
      firebase-tools

      # Mobile development tools
      cocoapods

      awscli2

      # IDLE
      jetbrains.datagrip
      jetbrains.phpstorm

      obsidian
    ];
  };

  system.primaryUser = vars.user;

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set the timezone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Set power management settings
  power = {
    sleep = {
      allowSleepByPowerButton = true;
      computer = 30;
      display = 20;
    };
  };

  # Set system configuration
  system = {
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = false;
        ApplePressAndHoldEnabled = false;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleEnableMouseSwipeNavigateWithScrolls = true;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.swipescrolldirection" = false;
      };

      loginwindow = {
        GuestEnabled = false;
        LoginwindowText = "Welcome to An's Macbook Pro";
      };

      screencapture = {
        location = "~/Pictures/screenshots";
      };

      WindowManager = {
        GloballyEnabled = true;
        EnableStandardClickToShowDesktop = true;
        AppWindowGroupingBehavior = false;
        StandardHideDesktopIcons = false;
        StandardHideWidgets = false;
        StageManagerHideWidgets = false;
        HideDesktop = false;
      };

      controlcenter = {
        Bluetooth = true;
        Sound = true;
        AirDrop = false;
        Display = false;
        FocusModes = false;
        NowPlaying = false;
      };

      finder = {
        NewWindowTarget = "Home";
        AppleShowAllFiles = true;

        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowPathbar = true;
        ShowStatusBar = true;

        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirstOnDesktop = true;
        _FXSortFoldersFirst = true;
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadThreeFingerDrag = true;
        TrackpadThreeFingerTapGesture = 0;
      };

      screensaver.askForPasswordDelay = 10;

      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          # Disable creating .DS_Store files in network an USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        # Privacy
        "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
      };

      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        orientation = "bottom";
        tilesize = 48;
        # Set dock persistent apps
        persistent-apps = [
          "${pkgs.wezterm}/Applications/WezTerm.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/Applications/Notion.app"
          "/Applications/Arc.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Skype.app"
          "/Applications/Zalo.app"
          "/Applications/Xcode.app"
          "/Applications/Visual Studio Code.app"
          "${pkgs.jetbrains.phpstorm}/Applications/PhpStorm.app"
          "${pkgs.jetbrains.datagrip}/Applications/DataGrip.app"
          "/System/Applications/Music.app"
          "/System/Applications/Notes.app"
          "/System/Applications/System Settings.app"
        ];
      };
    };
  };
}
