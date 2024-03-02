{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "Fira Code";
      size = 10;
    };
  };
}
