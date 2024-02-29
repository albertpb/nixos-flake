{ inputs, username, ... }:
{
  imports = [ (import ./hyprland.nix) ]
    ++ [ (import ./vscodium.nix) ]
    ++ [ (import ./rofi.nix) ]
    ++ [ (import ./waybar.nix) ]
    ++ [ (import ./kitty.nix) ]
    ++ [ (import ./keeweb) ];
}
