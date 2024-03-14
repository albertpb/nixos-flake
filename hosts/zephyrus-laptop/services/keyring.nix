{ pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = true;
}
