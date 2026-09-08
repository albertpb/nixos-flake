{ pkgs, ...}:
{
    services.samba = {
        enable = true;
        openFirewall = true;

        settings = {
            global = {
            "server min protocol" = "SMB2";
            "map to guest" = "never";
            };

            shared = {
            path = "/data/ext";
            browseable = "yes";
            "read only" = "no";
            "valid users" = "albert";
            "force user" = "albert";
            "force group" = "users";
            "create mask" = "0664";
            "directory mask" = "0775";
            };
        };
    };
}