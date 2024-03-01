{ pkgs, ... }:
{
  security = {
    polkit = enable;
    rtkit = enable;
  };
}
