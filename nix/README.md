# Nix Configs

To install (because I'm quite lazy) just run:

```bash
git clone https://github.com/smsimone/dotfiles.git $HOME/.config
cd $HOME/.config/nixos-config

if [[ "$OSTYPE" == "darwin"* ]]; then 
    sh <(curl -L https://nixos.org/nix/install)
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then 
    pkgs=(xz-utils git curl)
    apt update && apt install -y "${pkgs[@]}"

    sh <(curl -L https://nixos.org/nix/install) --daemon
else 
    echo "Just install a better OS"
    exit 1
fi


```
