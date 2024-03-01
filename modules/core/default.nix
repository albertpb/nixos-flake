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
        (import ./user.nix)
      ] ++ [
        (import ./packages.nix)
      ] ++ [
        (import ./services)
      ] ++ [
        (import ./security.nix)
      ] ++ [
        (import ./sound.nix)
      ];
    };
}
