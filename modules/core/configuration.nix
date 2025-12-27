{ pkgs, ... }:
{
  environment = {
    variables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      GTK_USE_PORTAL = "1";
    };
  };

  environment.sessionVariables = {
    PATH = "$HOME/.config/emacs/bin:$PATH";
  };
}
