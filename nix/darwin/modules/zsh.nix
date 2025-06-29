#
#  Shell
#
{
  pkgs,
  vars,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      eza # Ls
      zsh-powerlevel10k # Prompt
    ];
  };

  home-manager.users.${vars.user} = {
    home.file.".p10k.zsh".source = ./p10k.zsh;

    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        history.size = 10000;
        oh-my-zsh = {
          enable = true;
          plugins = [
          ];
        };
        shellAliases = {
          "c" = "clear";
          ".." = "cd ..";
        };
        initContent = ''
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

            ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

            alias ls="${pkgs.eza}/bin/eza --icons=always --color=always"
            alias finder="ofd" # open find in current path.
            #cdf will change directory to active finder directory

            export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
            export PATH="$PATH:$HOME/fvm/default/bin"
            export PATH="$PATH":"$HOME/.pub-cache/bin"
            export PATH="$PATH:/usr/local/bin"
            ## [Completion]
            ## Completion scripts setup. Remove the following line to uninstall
            [[ -f /Users/quocan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/quocan/.dart-cli-completion/zsh-config.zsh || true
            ## [/Completion]
        '';
        # initExtra = ''
        #   export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
        #   export PATH="$PATH:$HOME/fvm/default/bin"
        #   export PATH="$PATH":"$HOME/.pub-cache/bin"
        #   export PATH="$PATH:/usr/local/bin"
        #   ## [Completion]
        #   ## Completion scripts setup. Remove the following line to uninstall
        #   [[ -f /Users/quocan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/quocan/.dart-cli-completion/zsh-config.zsh || true
        #   ## [/Completion]
        # '';
      };
    };
  };
}
