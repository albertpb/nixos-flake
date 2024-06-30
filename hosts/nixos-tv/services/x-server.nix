{ pkgs, username, ... }:
{
  services.displayManager = {
    defaultSession = "none+bspwm";
  };

  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

    
    screenSection = ''
      Option	"metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option	"AllowIndirectGLXProtocol" "off"
      Option	"TripleBuffer" "on"
    '';


    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      sx.enable = true;
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
