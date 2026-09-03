{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ]
  ++ [ (import ./hyprland.nix) ]
  ++ [ (import ../../../modules/core/home/keyring.nix) ]
  ++ [ (import ../../../modules/core/home/git.nix) ]
  ++ [ (import ../../../modules/core/home/bashrc.nix) ];
}
