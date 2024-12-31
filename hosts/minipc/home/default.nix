{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ] ++ [ (import ./git.nix) ] 
    ++ [ (import ./bashrc.nix) ];
}
