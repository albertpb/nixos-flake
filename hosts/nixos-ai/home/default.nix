{ inputs, username, ... }:
{
  imports = [ (import ./vscodium.nix) ]
    ++ [ (import ./rofi.nix) ]
    ++ [ (import ./kitty.nix) ]
    ++ [ (import ./git.nix) ]
    ++ [ (import ./dunst.nix) ]
    ++ [ (import ./picom.nix) ]
    ++ [ (import ./polybar.nix) ]
    ++ [ (import ./sxhkd.nix) ]
    ++ [ (import ./zsh.nix) ];
}
