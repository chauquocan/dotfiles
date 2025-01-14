#
#  Shell
#
{
  pkgs,
  vars,
  ...
}: let
  name = "Quoc An";
  email = "chauquocan2090@gmail.com";
in {
  environment = {
    systemPackages = with pkgs; [
      openssh
    ];
  };

  home-manager.users.${vars.user} = {
    programs = {
      git = {
        enable = true;
        ignores = ["*.swp"];
        userName = name;
        userEmail = email;
        lfs = {
          enable = true;
        };
        extraConfig = {
          init.defaultBranch = "main";
          core = {
            editor = vars.editor;
            autocrlf = "input";
          };
          http.postBuffer = "1048576000";
          http.version = "HTTP/1.1";
          core.compression = 0;
          commit.gpgsign = false;
          pull.rebase = true;
          rebase.autoStash = true;
        };
      };
    };
  };
}
