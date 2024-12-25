{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetch
    mkalias
    zoxide
    btop

    postman

    # IDLE
    jetbrains.datagrip
    jetbrains.phpstorm

    # Cloud-related tools and SDKs
    docker
    docker-compose
    awscli2

    # archives
    zip
    xz
    unzip

    # utils
    jq
    jetbrains-mono
    fd

    #rustup
    lazygit
    eza
    
    bat
    tmux
    git

    obsidian
  ];
}
