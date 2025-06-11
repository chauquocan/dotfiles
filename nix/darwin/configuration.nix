#
#  Main MacOS system configuration.
#
#  flake.nix
#   └─ ./darwin
#       ├─ homebrew
#       ├─ modules
#       ├─ default.nix
#       ├─ configuration.nix *
#       └─ ./modules
#           └─ default.nix
#
{
  pkgs,
  vars,
  ...
}: {
  imports = import ./modules;

  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
    shell = pkgs.zsh;
  };

  environment = {
    variables = {
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      eza # Ls
      git # Version Control
      mas # Mac App Store $ mas search <app>
      bat #
      fzf #
      lazygit #
    ];
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.meslo-lg
    pkgs.nerd-fonts.fira-code
  ];

  home-manager.users.${vars.user} = {
    home.stateVersion = "23.05";
  };

  # services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      # auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  system = {
    stateVersion = 5;
  };
}
