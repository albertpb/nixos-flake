{ pkgs, ... }: {
  imports = [ (import ./greetd.nix) ] ++ [ (import ./ollama.nix) ]
    ++ [ (import ./ssh.nix) ];
}
