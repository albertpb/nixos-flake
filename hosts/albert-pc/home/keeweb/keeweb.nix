let
  pkgs = import <nixpkgs> { };
in
pkgs.symlinkJoin {
  name = "keeweb";
  paths = [ pkgs.keeweb ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/keeweb \
      --add-flags "--in-process-gpu"
  '';
}
