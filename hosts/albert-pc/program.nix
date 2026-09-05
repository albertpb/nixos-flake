{ inputs, pkgs, ... }: {
  imports = [ inputs.dms.nixosModules.dank-material-shell ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

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
