{ pkgs, ... }:
{
  imports = [
    (import ./kde.nix)
  ] ++ [
    (import ./keyring.nix)
  ] ++ [
    (import ./sunshine.nix)
  ] ++ [
    (import ./printer.nix)
  ] ++ [
    (import ./ollama.nix)
  ];
}
