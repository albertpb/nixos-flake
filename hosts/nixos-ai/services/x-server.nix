{ pkgs, username, ... }:
{
  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];


    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      sx.enable = true;
      defaultSession = "none+bspwm";
    };

    excludePackages = [ pkgs.xterm ];

    windowManager.bspwm = {
      enable = true;
      sxhkd.package = pkgs.sxhkd;
      configFile = "/home/${username}/.config/bspwm/bspwmrc";
      sxhkd.configFile = "/home/${username}/.config/sxhkd/sxhkdrc";
    };
  };
}
