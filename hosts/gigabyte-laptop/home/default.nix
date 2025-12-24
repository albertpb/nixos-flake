{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ]
  ++ [ (import ./keyring.nix) ]
  ++ [ (import ./hyprland.nix) ]
  ++ [ (import ./rofi.nix) ]
  ++ [ (import ./waybar.nix) ]
  ++ [ (import ./git.nix) ]
  ++ [ (import ./mako.nix) ]
  ++ [ (import ./bashrc.nix) ];
}
