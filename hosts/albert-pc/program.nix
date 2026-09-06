{ inputs, pkgs, ... }: {
  imports = [ inputs.dms.nixosModules.dank-material-shell ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;

    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    enableCalendarEvents = false;
  };

  programs.thunar = {
    enable = true;
  };

  programs.nix-ld.enable = true;

}
