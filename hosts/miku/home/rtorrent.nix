{ pkgs, config, ... }:
{
  home.file.".rtorrent.rc".text = ''
    # Set the default directory where downloads will go
    directory = ~/Downloads

    # Set the session directory (where the torrent data is stored)
    session = ~/.rtorrent/session

    # Port range for incoming connections (can be adjusted based on your network)
    port_range = 6881-6889
  '';
}
