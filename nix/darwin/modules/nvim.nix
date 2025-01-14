{
  config,
  lib,
  system,
  pkgs,
  stable,
  vars,
  ...
}: let
in {
  environment = {
    systemPackages = with pkgs; [
    ];
    variables = {
    };
  };

  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;

    opts = {
      number = true;
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Number of spaces to use for auto-indent
    };
  };

  home-manager.users.${vars.user} = {
  };
}
