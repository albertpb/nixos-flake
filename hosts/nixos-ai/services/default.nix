{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)	
  ] ++ [
    (import ./sunshine.nix)
  ] ++ [
    (import ./printer.nix)
  ] ++ [
    (import ./ollama.nix)
  ];
}
