{ pkgs, ... }:
{
  home.file.".config/polybar/colors.ini".text = ''
    # Web
    super + shift + w
      brave-browser

    # Terminal
    super + q
      kitty

    # App Launcher
    super + space
      rofi -show drun


    # Logout / Restart Bspwm (Restart is config Bspwmrc)
    super + m
      bspc {quit,wm -r}

    # Close Window
    super + c
        bspc node -c

    # Set titling, Floating or PresudoTitling
    super + {t,shift + t,s}
      bspc node -t {tiled,pseudo_tiled,floating}

    # Toggle Fullscren
    super + f
      bspc node -t {fullscreen} || \
      bspc node -t {tiled}

    # Toggle Floating Window
    super + shift + space
      bspc node -t {floating} || \
      bspc node -t {tiled}

    # (To use different layouts as seen bellow download Bsp-Layout: https://github.com/phenax/bsp-layout)

    super + a
      bsp-layout set monocle

    super + shift + a
      bsp-layout set title

    alt + g 
      bsp-layout set grid

    alt + shift + g
      bsp-layout set rgrid



    # send the newest marked node to the newest preselected node
    super + y
      bspc node newest.marked.local -n newest.!automatic.local

    # swap the current node and the biggest window
    super + g
      bspc node -s biggest.window

    # set the node flags
    super + ctrl + {m,x,y,z}
      bspc node -g {marked,locked,sticky,private}

    # set the node flags
    super + ctrl + {m,x,y,z}
      bspc node -g {marked,locked,sticky,private}

    super + z
      bspc node -g sticky

    # preselect the direction
    super + ctrl + {h,j,k,l}
            bspc node -p {west,south,north,east}

    # preselect the ratio
    super + ctrl + {1-9}
      bspc node -o 0.{1-9}

    # cancel the preselection for the focused node
    super + ctrl + space
      bspc node -p cancel

    # cancel the preselection for the focused desktop
    super + ctrl + shift + space
      bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

    # Change Workspace
    super + {1,2,3,4,5,6,7,8,9,0}
      bspc desktop -f {1,2,3,4,5,6,7,8,9,0}

    # Move a window to a Different Workspace
    super + shift + {1-9,0}
      bspc node -d '^{1-9,10}'

    # Make a Floating Window Larger
    super + ctrl + {Left,Down,Up,Right}
        STEP=20; SELECTION={1,2,3,4}; \
        bspc node -z $(echo "left -$STEP 0,bottom 0 $STEP,top 0 -$STEP,right $STEP 0" | cut -d',' -f$SELECTION) || \
        bspc node -z $(echo "right -$STEP 0,top 0 $STEP,bottom 0 -$STEP,left $STEP 0" | cut -d',' -f$SELECTION)

    # Make a Floating Window Smaller
    super + alt + {Left,Down,Up,Right}
      bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

    # Move floating window
    ctrl + alt + {Left,Down,Up,Right}
      bspc node -v {-20 0,0 20,0 -20,20 0}

    # focus the node in the given direction
    super + {_,shift + }{Left,Down,Up,Right}
      bspc node -{f,s} {west,south,north,east}

    # focus the node for the given path jump
    super + {p,b,comma,period}
      bspc node -f @{parent,brother,first,second}

    # focus the next/previous window in the current desktop
    super + {_,shift + }c
      bspc node -f {next,prev}.local.!hidden.window

    # focus the next/previous desktop in the current monitor
    super + bracket{left,right}
      bspc desktop -f {prev,next}.local

    # focus the last node/desktop
    super + {grave,Tab}
      bspc {node,desktop} -f last

    # focus the older or newer node in the focus history
    super + {o,i}
      bspc wm -h off; \
      bspc node {older,newer} -f; \
      bspc wm -h on

    # focus or send to the given desktop
    #super + {_,shift + }{1-9,0}
    #	bspc {desktop -f,node -d} '^{1-9,10}'

    # focus or send to the given desktop
    super + {_,shift + } + {KP_End,KP_Down,KP_Next,KP_Left,KP_Begin,KP_Right,KP_Home,KP_Up,KP_Prior,KP_Add}
      bspc {desktop -f,node -d} '^{1-9,10}'

  '';
}
