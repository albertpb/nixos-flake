{ pkgs, config, ... }:
let
  services = config.services;
  dmcfg = services.displayManager;
  sessionData = dmcfg.sessionData;
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  # hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
  # hyprland-session = "${sessionData.desktops}/share/wayland-sessions";
in
{
  services.greetd = {
    enable = true;
    #vt = config.services.xserver.tty;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --cmd 'sx bspwm'";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
