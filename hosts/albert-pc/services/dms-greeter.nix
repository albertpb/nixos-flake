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

        monitor = DP-1,preferred,0x0,1,transform,1

        exec-once = sleep 1 && hyprctl keyword monitor "DP-1,preferred,0x0,1,transform,1"

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
