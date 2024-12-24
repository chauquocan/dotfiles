{ pkgs }:

with pkgs; [
  # General packages for development and system management
  iterm2
  bash-completion
  btop
  neofetch
  awscli2

  # IDLE
  jetbrains.datagrip
  jetbrains.phpstorm

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2

  # Cloud-related tools and SDKs
  docker
  docker-compose

  # Media-related packages
  emacs-all-the-icons-fonts
  dejavu_fonts
  ffmpeg
  fd
  font-awesome
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs

  # Text and terminal utilities
  jetbrains-mono
  jq
  tree
  tmux
  unrar
  unzip
  zsh-powerlevel10k

  # Python packages
  #python3
  #virtualenv
]
