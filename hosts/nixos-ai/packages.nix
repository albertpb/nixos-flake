{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
  ];
}
