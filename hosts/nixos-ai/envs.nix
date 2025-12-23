{ pkgs, ... }:
{
  environment.variables = {
    "CUDA_VISIBLE_DEVICES" = "0,1";
  };
}
