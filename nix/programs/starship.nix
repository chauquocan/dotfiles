{pkgs, ...}: let
  generatedStarshipConfig =
    pkgs.runCommand "generate-starship-config" {
      buildInputs = [pkgs.starship];
    } ''
      mkdir -p $out
      starship preset gruvbox-rainbow -o $out/starship.toml
    '';
  starshipConfigs = builtins.fromTOML (builtins.readFile "${generatedStarshipConfig}/starship.toml");
in {
  programs.starship = {
    enable = true;
    settings = starshipConfigs;
  };
}
