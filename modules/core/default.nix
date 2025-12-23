{ inputs, nixpkgs, self, username, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in {
  albert-pc = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/albert-pc/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/albert-pc/packages.nix) ]
      ++ [ (import ./../../hosts/albert-pc/user.nix) ]
      ++ [ (import ./../../hosts/albert-pc/services) ]
      ++ [ (import ./../../hosts/albert-pc/security.nix) ]
      ++ [ (import ./../../hosts/albert-pc/program.nix) ]
      ++ [ (import ./../../hosts/albert-pc/nvidia.nix) ]
      ++ [ (import ./../../hosts/albert-pc/network.nix) ]
      ++ [ (import ./../../hosts/albert-pc/bluetooth.nix) ]
      ++ [ (import ./../../hosts/albert-pc/distrobox.nix) ]
      ++ [ (import ./../../hosts/albert-pc/xdg.nix) ]
      ++ [ (import ./configuration.nix) ]
      ++ [ (import ./../../hosts/albert-pc/virtualisation/default.nix) ]
      ++ [ (import ./network.nix) ] ++ [ (import ./system.nix) ]
      ++ [ (import ./fonts.nix) ] ++ [ (import ./packages.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./security.nix) ]
      ++ [ (import ./sound.nix) ];
  };

  miku-pc = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/miku/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/miku/packages.nix) ]
      ++ [ (import ./../../hosts/miku/user.nix) ]
      ++ [ (import ./../../hosts/miku/services) ]
      ++ [ (import ./../../hosts/miku/security.nix) ]
      ++ [ (import ./../../hosts/miku/program.nix) ]
      ++ [ (import ./../../hosts/miku/network.nix) ]
      ++ [ (import ./../../hosts/miku/bluetooth.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./packages.nix) ] ++ [ (import ./user-packages.nix) ]
      ++ [ (import ./security.nix) ] ++ [ (import ./sound.nix) ];
  };

  nixos-ai = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/nixos-ai/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/packages.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/user.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/services) ]
      ++ [ (import ./../../hosts/nixos-ai/program.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/network.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/envs.nix) ]
      ++ [ (import ./../../hosts/nixos-ai/xdg.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./packages.nix) ] ++ [ (import ./user-packages.nix) ]
      ++ [ (import ./security.nix) ] ++ [ (import ./sound.nix) ];
  };

  gigabyte-laptop = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules =
      [ (import ./../../hosts/gigabyte-laptop/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/packages.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/user.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/services) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/security.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/program.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/network.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/bluetooth.nix) ]
      ++ [ (import ./../../hosts/gigabyte-laptop/xdg.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./sound.nix) ] ++ [ (import ./packages.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./security.nix) ];
  };

  zephyrus-laptop = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules =
      [ (import ./../../hosts/zephyrus-laptop/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/packages.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/user.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/services) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/security.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/program.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/network.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/bluetooth.nix) ]
      ++ [ (import ./../../hosts/zephyrus-laptop/xdg.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./sound.nix) ] ++ [ (import ./packages.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./security.nix) ];
  };

  nixos-tv = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/nixos-tv/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/packages.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/user.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/services) ]
      ++ [ (import ./../../hosts/nixos-tv/program.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/network.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/virtualisation/default.nix) ]
      ++ [ (import ./../../hosts/nixos-tv/xdg.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./packages.nix) ] ++ [ (import ./security.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./sound.nix) ];
  };

  minipc = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/minipc/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/minipc/radeon.nix) ]
      ++ [ (import ./../../hosts/minipc/packages.nix) ]
      ++ [ (import ./../../hosts/minipc/services) ]
      ++ [ (import ./../../hosts/minipc/user.nix) ]
      ++ [ (import ./configuration.nix) ]
      ++ [ (import ./../../hosts/minipc/network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./packages.nix) ]
      ++ [ (import ./../../hosts/minipc/virtualisation.nix) ];
  };

  nixos-gaming = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/nixos-gaming/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/nixos-gaming/packages.nix) ]
      ++ [ (import ./../../hosts/nixos-gaming/user.nix) ]
      ++ [ (import ./../../hosts/nixos-gaming/services) ]
      ++ [ (import ./../../hosts/nixos-gaming/program.nix) ]
      ++ [ (import ./../../hosts/nixos-gaming/network.nix) ]
      ++ [ (import ./../../hosts/nixos-gaming/xdg.nix) ]
      ++ [ (import ./configuration.nix) ] ++ [ (import ./network.nix) ]
      ++ [ (import ./system.nix) ] ++ [ (import ./fonts.nix) ]
      ++ [ (import ./packages.nix) ] ++ [ (import ./security.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./sound.nix) ];
  };

  nzxt = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };

    modules = [ (import ./../../hosts/nzxt/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/nzxt/packages.nix) ]
      ++ [ (import ./../../hosts/nzxt/user.nix) ]
      ++ [ (import ./../../hosts/nzxt/services) ]
      ++ [ (import ./../../hosts/nzxt/security.nix) ]
      ++ [ (import ./../../hosts/nzxt/program.nix) ]
      ++ [ (import ./../../hosts/nzxt/nvidia.nix) ]
      ++ [ (import ./../../hosts/nzxt/network.nix) ]
      ++ [ (import ./../../hosts/nzxt/bluetooth.nix) ]
      ++ [ (import ./../../hosts/nzxt/distrobox.nix) ]
      ++ [ (import ./../../hosts/nzxt/xdg.nix) ]
      ++ [ (import ./configuration.nix) ]
      ++ [ (import ./network.nix) ] ++ [ (import ./system.nix) ]
      ++ [ (import ./fonts.nix) ] ++ [ (import ./packages.nix) ]
      ++ [ (import ./user-packages.nix) ] ++ [ (import ./security.nix) ]
      ++ [ (import ./sound.nix) ];
  };
}
