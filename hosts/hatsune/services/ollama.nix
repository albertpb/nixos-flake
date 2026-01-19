{ pkgs, ... }: {
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    openFirewall = true;
    host = "0.0.0.0";
    port = 11434;

    environmentVariables = { };
  };

  services.open-webui = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 8080;
  };
}
