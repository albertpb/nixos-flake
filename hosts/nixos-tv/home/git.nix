{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = "albertpb";
        email = "palumbo.alb@gmail.com";
      };

      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
