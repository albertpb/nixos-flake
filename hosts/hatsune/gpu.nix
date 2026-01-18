{ pkgs, config, ... }: {
  hardware.graphics = {
        enable = true;
  };

  # Load driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ]; 

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    nvidiaPersistenced = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
