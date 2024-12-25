{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.stateVersion = "23.05";

  imports = [./programs/starship.nix];

  home.sessionVariables = rec {
    EDITOR = "vim";
    PATH = "$PATH:/Users/quocan/fvm/default/bin:${GOBIN}";
  };

  programs = {
    home-manager.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      userName = "Quoc An";
      userEmail = "chauquocan2090@gmail.com";
      ignores = [".DS_Store"];
      extraConfig = {
        init.defaultBranch = "main";
        core = {
	        editor = "vim";
          autocrlf = "input";
        };
        commit.gpgsign = false;
        pull.rebase = true;
        rebase.autoStash = true;
        push.autoSetupRemote = true;
      };
    };
    # Create /etc/zshrc that loads the nix-darwin environment.
    zsh = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        cd = "z";
        garbage = "sudo nix-collect-garbage --delete-older-than 14d";
        nopt = "sudo nix-store --optimise";
        neu = "sudo nix-env --upgrade";
        erebuild = "(cd ~/.config/nixos-config && $EDITOR .) && rebuild";
        rebuild = "darwin-rebuild switch --flake ~/.config/nixos-config";
        gw = "git worktree";
        l = "ls -lha";
        fastlane = "bundle exec fastlane";
        flutter = "fvm flutter";
        lg = "lazygit";
        ls = "eza";
        ".." = "cd ..";
      };

      plugins = [
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "2d60a47cc407117815a1d7b331ef226aa400a344";
            sha256 = "1pnxr39cayhsvggxihsfa3rqys8rr2pag3ddil01w96kw84z4id2";
          };
        }
      ];

      initExtra = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH=/run/current-system/sw/bin:$PATH
      '';

      history = {
        size = 5000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };
  };
}
