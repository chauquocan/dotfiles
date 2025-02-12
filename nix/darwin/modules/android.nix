{
  pkgs,
  vars,
  config,
  lib,
  android-nixpkgs,
  system,
  ...
}: let
  android-sdk-home-path = "Library/Android/sdk";
  android-sdk = android-nixpkgs.sdk.${system} (sdkPkgs:
    with sdkPkgs; [
      cmdline-tools-latest
      build-tools-34-0-0
      build-tools-30-0-3
      platform-tools
      platforms-android-34
      platforms-android-33
      platforms-android-31
      emulator
      system-images-android-34-google-apis-playstore-arm64-v8a
    ]);
in {
  environment.systemPackages = with pkgs; [
    jdk17
  ];

  home-manager.users.${vars.user} = {
    config = {
      home = {
        file.${android-sdk-home-path}.source = "${android-sdk}/share/android-sdk";

        packages = with pkgs; [
          android-sdk
          gradle
          jdk17
        ];

        sessionVariables = {
          # Required by android-studio on wm
          # _JAVA_AWT_WM_NONREPARENTING = "1";

          JAVA_HOME = pkgs.jdk17.home;
          ANDROID_HOME = "/$HOME/${android-sdk-home-path}";
          ANDROID_SDK_ROOT = "/$HOME/${android-sdk-home-path}";
        };
      };
    };
  };
  # Add system-level directory creation
  system.activationScripts.postActivation.text = ''
    mkdir -p "$HOME/${android-sdk-home-path}"
    mkdir -p "$HOME/.android"
    mkdir -p "$HOME/.android/avd"
  '';
}
