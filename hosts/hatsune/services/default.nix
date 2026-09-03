{ pkgs, ... }: {
  imports = [ (import ./dms-greeter.nix) ] ++ [ (import ./ssh.nix) ];
}
