{ username, pkgs, ... }:
{
  home.file.".config/mako/config".text = ''
    sort=-time
    layer=overlay
    background-color=#1e1e2e
    width=300
    height=110
    border-size=2
    text-color=#cdd6f4
    border-color=#89b4fa
    progress-color=#313244
    border-radius=15
    icons=0
    max-icon-size=64
    default-timeout=3000
    font=monospace 14

    [urgency=low]
    border-color=#cccccc

    [urgency=normal]
    border-color=#d08770

    [urgency=high]
    border-color=#fab387
    default-timeout=0

    [category=mpd]
    default-timeout=2000
    group-by=category
  '';
}
