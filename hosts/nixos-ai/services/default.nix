{ pkgs, ... }:
{
  imports = [
    (import ./kde.nix)
  ]
  ++ [
    (import ./dms-greeter.nix)
  ]
  ++ [
    (import ./printer.nix)
  ]
  ++ [
    (import ./sunshine.nix)
  ];
}
