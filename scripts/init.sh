#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f "$HOME/.config/starship.toml" ]; then
	export STARSHIP_CONFIG="$HOME/.config/starship.toml"
fi

source "$(dirname "$0")/path.sh"
source "$(dirname "$0")/aliases.sh"
source "$(dirname "$0")/scripts.sh"
source "$(dirname "$0")/prompt.sh"
