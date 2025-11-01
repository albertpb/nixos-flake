{ pkgs, ... }: {
  imports = [ (import ./greetd.nix) ] ++ [ (import ./keyring.nix) ]
    ++ [ (import ./udev.nix) ] ++ [ (import ./bolt.nix) ];
}
