{ username, ... }: {
  home.file.".config/hypr/hyprpaper.conf".text = ''
    #enable splash text rendering over the wallpaper
    splash = false

    #fully disable ipc
    # ipc = off
    ipc = on

    wallpaper {
      monitor = 
      path = /home/${username}/wallpapers
      order = random
      fit_mode = cover
    }
  '';

}
