{ pkgs, username, ... }: {
  # albert-pc
  users.users.${username}.packages = with pkgs; [
    radeontop
  ];
}
