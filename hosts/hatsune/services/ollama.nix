{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    environmentVariables = {
    };
  };

  services.open-webui.enable = true;
}
