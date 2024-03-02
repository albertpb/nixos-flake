{ inputs, nixpkgs, self, username, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = false;
  };
  lib = nixpkgs.lib;
in
{
  albert-pc = nixpkgs.lib.nixosSystem
    {
      specialArgs = { inherit self inputs username; };

      modules = [
        (import ./../../hosts/albert-pc/hardware-configuration.nix)
      ] ++ [
        (import ./../../hosts/albert-pc/packages.nix)
      ] ++ [
        (import ./../../hosts/albert-pc/user.nix)
      ] ++ [
        (import ./../../hosts/albert-pc/services)
      ] ++ [
        (import ./virtualisation/default.nix)
      ] ++ [
        (import ./bootloader.nix)
      ] ++ [
        (import ./network.nix)
      ] ++ [
        (import ./program.nix)
      ] ++ [
        (import ./system.nix)
      ] ++ [
        (import ./fonts.nix)
      ] ++ [
        (import ./packages.nix)
      ] ++ [
        (import ./security.nix)
      ] ++ [
        (import ./sound.nix)
      ];
    };

  nixos-ai = nixpkgs.lib.nixosSystem
    {
      specialArgs = { inherit self inputs username; };

      modules = [
        (import ./../../hosts/nixos-ai/hardware-configuration.nix)
      ] ++ [
        (import ./../../hosts/nixos-ai/packages.nix)
      ] ++ [
        (import ./../../hosts/nixos-ai/user.nix)
      ] ++ [
        (import ./../../hosts/nixos-ai/services)
      ] ++ [
        (import ./bootloader.nix)
      ] ++ [
        (import ./network.nix)
      ] ++ [
        (import ./program.nix)
      ] ++ [
        (import ./system.nix)
      ] ++ [
        (import ./fonts.nix)
      ] ++ [
        (import ./packages.nix)
      ] ++ [
        (import ./security.nix)
      ] ++ [
        (import ./sound.nix)
      ];
    };
}
