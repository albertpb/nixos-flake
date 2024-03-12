{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "Fira Code";
      size = 10;
    };
    extraConfig = ''
      background_opacity 0.6
    '';
  };
}
