{ username, pkgs, ... }:
{
  home.file.".config/hypr/hyprland.conf".text = ''
    ########################################################################################
    AUTOGENERATED HYPR CONFIG.
    PLEASE USE THE CONFIG PROVIDED IN THE GIT REPO /examples/hypr.conf AND EDIT IT,
    OR EDIT THIS ONE ACCORDING TO THE WIKI INSTRUCTIONS.
    ########################################################################################

    #
    # Please note not all available settings / options are set here.
    # For a full list, see the wiki
    #

    # See https://wiki.hyprland.org/Configuring/Monitors/
    # monitor=,preferred,auto,auto
    monitor=,2560x1440@170,0x0,1

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more

    # Execute your favorite apps at launch
    exec-once=hyprctl setcursor capitaine-cursors 24
    exec-once=waybar
    exec-once=hyprpaper
    exec-once=blueman-applet
    exec-once=gnome-keyring-daemon --daemonize
    exec-once=nm-applet --indicator

    # Source a file (multi-file configs)
    source = ~/.config/hypr/colors.conf

    # Some default env vars.
    env = XCURSOR_SIZE,24
    env = WLR_DRM_DEVICES,/dev/dri/card0

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
        kb_layout = latam
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        touchpad {
            natural_scroll = no
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
    }

    decoration {
        rounding = 3
        
        blur {
            enabled = true
            passes = 2
            new_optimizations = true
            noise = 0.02
            size = 8
            contrast = 1.6
            brightness 1.1
        }
    }

    animations {
        enabled = yes

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }

    master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
    }

    gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = off
    }

    misc {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
        disable_hyprland_logo = true
        disable_splash_rendering = true
        vrr = 1
    }

    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
    device:epic-mouse-v1 {
        sensitivity = -0.5
    }


    # Layer Rules
    layerrule = blur,rofi
    layerrule = blur,waybar
    blurls = waybar
    blurls = rofi

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    # windowrulev2 = opacity 0.7 0.7,class:^(kitty)$

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    $mainMod = SUPER

    $w1 = hyprctl hyprpaper wallpaper "DP-2,~/wallpapers/1.png"
    $w2 = hyprctl hyprpaper wallpaper "DP-2,~/wallpapers/2.png"
    $w3 = hyprctl hyprpaper wallpaper "DP-2,~/wallpapers/3.png"
    $w4 = hyprctl hyprpaper wallpaper "DP-2,~/wallpapers/4.png"
    $w5 = hyprctl hyprpaper wallpaper "DP-2,~/wallpapers/5.png"

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, Q, exec, kitty
    bind = $mainMod, C, killactive, 
    bind = $mainMod, M, exit, 
    # bind = $mainMod, E, exec, dolphin
    bind = $mainMod, V, togglefloating, 
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, SPACE, exec, rofi -show run

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 1, exec,$w1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 2, exec,$w2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 3, exec,$w3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 4, exec,$w4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 5, exec,$w5

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 1, exec,$w1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 2, exec,$w2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 3, exec,$w3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 4, exec,$w4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 5, exec,$w5

    # Example special workspace (scratchpad)
    # bind = $mainMod, S, togglespecialworkspace, magic
    # bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bind = $mainMod SHIFT, S, exec, grim -g "$(slurp -d)" - | wl-copy
    bind = ,Print, exec, grim - | wl-copy

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
  '';

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /home/${username}/wallpapers/1.png

    wallpaper = ,/home/${username}/wallpapers/1.png

    #enable splash text rendering over the wallpaper
    splash = false

    #fully disable ipc
    # ipc = off
  '';

  home.file.".config/hypr/colors.conf".text = ''
    $rosewaterAlpha = f5e0dc
    $flamingoAlpha  = f2cdcd
    $pinkAlpha      = f5c2e7
    $mauveAlpha     = cba6f7
    $redAlpha       = f38ba8
    $maroonAlpha    = eba0ac
    $peachAlpha     = fab387
    $yellowAlpha    = f9e2af
    $greenAlpha     = a6e3a1
    $tealAlpha      = 94e2d5
    $skyAlpha       = 89dceb
    $sapphireAlpha  = 74c7ec
    $blueAlpha      = 89b4fa
    $lavenderAlpha  = b4befe

    $textAlpha      = cdd6f4
    $subtext1Alpha  = bac2de
    $subtext0Alpha  = a6adc8

    $overlay2Alpha  = 9399b2
    $overlay1Alpha  = 7f849c
    $overlay0Alpha  = 6c7086

    $surface2Alpha  = 585b70
    $surface1Alpha  = 45475a
    $surface0Alpha  = 313244

    $baseAlpha      = 1e1e2e
    $mantleAlpha    = 181825
    $crustAlpha     = 11111b

    $rosewater = 0xfff5e0dc
    $flamingo  = 0xfff2cdcd
    $pink      = 0xfff5c2e7
    $mauve     = 0xffcba6f7
    $red       = 0xfff38ba8
    $maroon    = 0xffeba0ac
    $peach     = 0xfffab387
    $yellow    = 0xfff9e2af
    $green     = 0xffa6e3a1
    $teal      = 0xff94e2d5
    $sky       = 0xff89dceb
    $sapphire  = 0xff74c7ec
    $blue      = 0xff89b4fa
    $lavender  = 0xffb4befe

    $text      = 0xffcdd6f4
    $subtext1  = 0xffbac2de
    $subtext0  = 0xffa6adc8

    $overlay2  = 0xff9399b2
    $overlay1  = 0xff7f849c
    $overlay0  = 0xff6c7086

    $surface2  = 0xff585b70
    $surface1  = 0xff45475a
    $surface0  = 0xff313244

    $base      = 0xff1e1e2e
    $mantle    = 0xff181825
    $crust     = 0xff11111b
  '';
}
