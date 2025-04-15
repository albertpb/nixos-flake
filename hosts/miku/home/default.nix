{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ] ++ [ (import ./hyprland.nix) ]
  ++ [ (import ./vscodium.nix) ]
  ++ [ (import ./rofi.nix) ]
  ++ [ (import ./waybar.nix) ]
  ++ [ (import ./git.nix) ]
  ++ [ (import ./mako.nix) ]
  ++ [ (import ./bashrc.nix) ]
  ++ [ (import ./rtorrent.nix) ];
}
