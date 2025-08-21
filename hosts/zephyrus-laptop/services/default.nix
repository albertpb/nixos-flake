{ pkgs, ... }: {
  imports = [ (import ./greetd.nix) ] ++ [ (import ./keyring.nix) ]
    ++ [ (import ./power.nix) ];
}
