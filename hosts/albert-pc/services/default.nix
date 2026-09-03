{
  config,
  inputs,
  lib,
  pkgs,
  username,
  ...
}:
{
  imports = [
    inputs.dank-greeter.nixosModules.default
    (import ./udev.nix)
    (import ./bolt.nix)
  ];

  programs.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";
    configHome = "/home/${username}";
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
}
