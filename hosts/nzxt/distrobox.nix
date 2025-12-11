{ pkgs, username, ... }: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [ pkgs.distrobox pkgs.podman-compose ];

  users.users.${username}.packages = [ pkgs.podman-desktop ];
}
