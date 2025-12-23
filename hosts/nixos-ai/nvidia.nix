{
  pkgs,
  inputs,
  config,
  ...
}:
let
  package = config.boot.kernelPackages.nvidiaPackages.stable;
in
{
  nixpkgs.overlays = [
    inputs.nvidia-patch.overlays.default
  ];

  hardware.graphics = {
    enable = true;
  };
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ]; # or "nvidiaLegacy470 etc.

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    nvidiaPersistenced = false;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = pkgs.nvidia-patch.patch-nvenc (pkgs.nvidia-patch.patch-fbc package);
  };
}
