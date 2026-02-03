{ pkgs, ... }:
{
  imports = [
    (import ./kde.nix)
  ]
  ++ [
    (import ./greetd.nix)
  ]
  ++ [
    (import ./sunshine.nix)
  ]
  ++ [
    (import ./printer.nix)
  ]
  ++ [
    (import ./ollama.nix)
  ];
}
