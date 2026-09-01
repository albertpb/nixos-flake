{ pkgs, ... }:
{
  imports = [
    (import ./kde.nix)
  ]
  ++ [
    (import ./greetd.nix)
  ]
  ++ [
    (import ./printer.nix)
  ]
  ++ [
    (import ./sunshine.nix)
  ];
}
