{ pkgs, ... }:
{
  imports = [ (import ./dms-greeter.nix) ] ++ [ (import ./power.nix) ];
}
