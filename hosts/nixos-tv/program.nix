{ inputs, pkgs, ... }:
{
  imports = [ inputs.dms.nixosModules.dank-material-shell ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;

    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    enableCalendarEvents = false;
  };
}
