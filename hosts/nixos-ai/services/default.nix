{ pkgs, ... }:
{
  imports = [
    (import ./keyring.nix)
  ] ++ [
    (import ./sunshine.nix)
  ] ++ [
    (import ./printer.nix)
  ] ++ [
    (import ./ollama.nix)
  ];
}
