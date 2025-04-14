{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "albertpb";
    userEmail = "palumbo.alb@gmail.com";

    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
