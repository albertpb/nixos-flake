{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)	
    ] ++ [
    (import ./ollama.nix)
  ];
}
