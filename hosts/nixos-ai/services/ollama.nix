{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    environmentVariables = {
      "CUDA_VISIBLE_DEVICES" = "GPU-eb33864f-a591-1ceb-d371-5be0aca38b3a";
    };
  };

  services.open-webui.enable = true;
}
