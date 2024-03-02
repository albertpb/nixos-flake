{ inputs, username, ... }:
{
  imports = [ (import ./vscodium.nix) ]
    ++ [ (import ./rofi.nix) ]
    ++ [ (import ./kitty.nix) ]
    ++ [ (import ./git.nix) ];
}
