{
  inputs,
  lib,
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

  systemd.services.greetd = {
    environment.UWSM_SILENT_START = "2";
    preStart = lib.mkAfter ''
      printf '\033[2J\033[H' > /dev/tty1
    '';
    serviceConfig = {
      StandardOutput = "journal";
      StandardError = "journal";
      TTYPath = "/dev/tty1";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
