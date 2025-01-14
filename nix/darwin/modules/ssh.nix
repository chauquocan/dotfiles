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
      openssh
    ];
  };

  home-manager.users.${vars.user} = {
    programs = {
      ssh = {
        enable = true;
        forwardAgent = true;
        addKeysToAgent = "yes";
        matchBlocks = {
          "github.com" = {
            # Default GitHub account (personal)
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/chauquocan_github";
            identitiesOnly = true;
            extraOptions = {
              AddKeysToAgent = "yes";
            };
          };
          "github-work" = {
            # Work GitHub account
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/ancq_work_github";
            identitiesOnly = true;
            extraOptions = {
              AddKeysToAgent = "yes";
            };
          };
        };
      };
    };
  };
}
