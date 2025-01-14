#  Nix-Homebrew.
#
#  flake.nix
#   └─ ./darwin
#       ├─ homebrew
#         ├─ default.nix
#         └─ nix-homebrew.nix *
#       ├─ modules
#       ├─ default.nix
#       ├─ configuration.nix
#
{
  inputs,
  lib,
  user,
  ...
}: let
  inherit
    (inputs)
    nix-homebrew
    ;
in
  nix-homebrew.darwinModules.nix-homebrew {
    inherit lib;
  }
