#!/bin/bash

alias git-history="git diff-tree --no-commit-id --name-only -r "
alias vim='nvim'
alias gw='git worktree'
alias update='brew update && brew upgrade; brew cleanup'
#alias cd='z'
alias l='ls -lha'
alias fastlane='bundle exec fastlane'
alias flutter='fvm flutter'
alias ugit='lazygit'
alias ..='cd ..'

if command -v gitlab-ci-local &>/dev/null; then
    alias gcl="gitlab-ci-local"
fi

if command -v lazygit &>/dev/null; then
    alias lg="lazygit"
fi

if command -v eza &>/dev/null; then
    alias ls="eza"
fi

alias gprisma="go run github.com/steebchen/prisma-client-go"
