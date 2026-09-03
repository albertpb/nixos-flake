{
  inputs,
  username,
  ...
}:
{
  imports = [ inputs.dank-greeter.nixosModules.default ];

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
