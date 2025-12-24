{ pkgs, ... }:
{
  imports = [ (import ./greetd.nix) ] ++ [ (import ./power.nix) ];
}
