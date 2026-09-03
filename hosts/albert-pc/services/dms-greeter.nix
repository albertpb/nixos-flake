{
  inputs,
  username,
  ...
}:
{
  imports = [ inputs.dank-greeter.nixosModules.default ];

  programs.dms-greeter = {
    enable = true;
    compositor = {
      name = "hyprland";
      customConfig = ''
        env = DMS_RUN_GREETER,1

        monitor = HDMI-A-1,3840x2160@240,0x0,1
        monitor = HDMI-A-2,disable

        misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
        }
      '';
    };
    configHome = "/home/${username}";
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
}
