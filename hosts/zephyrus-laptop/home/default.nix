{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ]
  ++ [ (import ./hyprland.nix) ]
  ++ [ (import ./rofi.nix) ]
  ++ [ (import ./waybar.nix) ]
  ++ [ (import ./keeweb) ]
  ++ [ (import ./git.nix) ]
  ++ [ (import ./mako.nix) ]
  ++ [ (import ./bashrc.nix) ];
}
