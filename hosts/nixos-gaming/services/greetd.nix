{ pkgs, config, ... }:
let
  services = config.services;
  dmcfg = services.displayManager;
  sessionData = dmcfg.sessionData;
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  # wayland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
  wayland-session = "${sessionData.desktops}/share/wayland-sessions";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${tuigreet} --time --remember --remember-session --sessions ${wayland-session}";
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
