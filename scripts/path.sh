#!/bin/bash

export GO_PATH=~/go

IFS=":" read -rA current_paths <<<"$PATH"

paths=(
	"$GO_PATH/bin"
	"$HOME/.local/bin"
	"$HOME/.pub-cache/bin"
	"$HOME/.pyenv/bin"
	"$HOME/.scripts"
	"$HOME/.spicetify"
	"$HOME/Development/monarch/bin"
	"$HOME/Library/Android/sdk/tools/bin"
	"$HOME/fvm/default/bin"
	"/bin"
	"/opt/homebrew/bin"
	"/sbin"
	"/usr/bin"
	"/usr/local/bin/"
	"/usr/local/opt/libpq/bin"
	"/usr/local/sbin"
	"/usr/sbin"
  "$HOME/.local/bin"
)

paths_combined=""
for path_item in "${paths[@]}"; do
	if [ -z "${paths_combined}" ]; then
		found=false
		case "${current_paths[@]}" in *"$path_item"*) found=true ;; esac

		if ! "$found"; then
			paths_combined="$path_item"
		fi
	else
		if [ -d "${path_item}" ]; then
			paths_combined="${paths_combined}:${path_item}"
		fi
	fi
done

export PATH="$PATH:${paths_combined}"
