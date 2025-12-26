{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ]
  ++ [ (import ../../../modules/core/home/git.nix) ]
  ++ [ (import ../../../modules/core/home/bashrc.nix) ];
}
