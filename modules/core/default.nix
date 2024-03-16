{ inputs, nixpkgs, self, username, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
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
        (import ./../../hosts/albert-pc/security.nix)
      ] ++ [
        (import ./../../hosts/albert-pc/program.nix)
      ] ++ [
        (import ./../../hosts/albert-pc/network.nix)
      ] ++ [
        (import ./virtualisation/default.nix)
      ] ++ [
        (import ./network.nix)
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
        (import ./../../hosts/nixos-ai/program.nix)
      ] ++ [
        (import ./../../hosts/nixos-ai/network.nix)
      ] ++ [
        (import ./network.nix)
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

  gigabyte-laptop = nixpkgs.lib.nixosSystem
    {
      specialArgs = { inherit self inputs username; };

      modules = [
        (import ./../../hosts/gigabyte-laptop/hardware-configuration.nix)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/packages.nix)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/user.nix)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/services)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/security.nix)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/program.nix)
      ] ++ [
        (import ./../../hosts/gigabyte-laptop/network.nix)
      ] ++ [
        (import ./network.nix)
      ] ++ [
        (import ./system.nix)
      ] ++ [
        (import ./fonts.nix)
      ] ++ [
        (import ./sound.nix)
      ] ++ [
        (import ./packages.nix)
      ] ++ [
        (import ./security.nix)
      ];
    };

  zephyrus-laptop = nixpkgs.lib.nixosSystem
    {
      specialArgs = { inherit self inputs username; };

      modules = [
        (import ./../../hosts/zephyrus-laptop/hardware-configuration.nix)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/packages.nix)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/user.nix)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/services)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/security.nix)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/program.nix)
      ] ++ [
        (import ./../../hosts/zephyrus-laptop/network.nix)
      ] ++ [
        (import ./network.nix)
      ] ++ [
        (import ./system.nix)
      ] ++ [
        (import ./fonts.nix)
      ] ++ [
        (import ./sound.nix)
      ] ++ [
        (import ./packages.nix)
      ] ++ [
        (import ./security.nix)
      ];
    };
}
