{ pkgs, ... }: {
  services.deluge = {
    enable = true;
    web.enable = true;
  };
}
