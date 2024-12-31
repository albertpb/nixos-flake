{ pkgs, username, ... }:
let 
  cockpit-apps = pkgs.callPackage ../../nixpkgs/cockpit/default.nix { inherit pkgs; };
in
{
  users.users.${username}.packages = with pkgs; [
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    lazygit
    cockpit
    podman-tui
    dive
    docker-compose
    cockpit-apps.cockpit-podman
  ];
}
