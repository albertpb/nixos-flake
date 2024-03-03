{ pkgs, username, ... }:
{

  home.file.".config/polybar/config.ini".text = ''
    [colors]
    bg = #1a1b26
    bg-alt = #20212C
    fg = #c0caf5
    fg-alt = #5D5E72

    red = #ff7a93

    trans = #00000000
    semi-trans-black = #cc000000

    shade-1 = #32344a
    shade-2 = #444b6a
    shade-3 = #787c99
    shade-4 = #CACACE
    shade-5 = #acb0d0

    [bar/main]
    width = 100%
    height = 35
    offset-y = 0
    top = true
    fixed-center = true

    wm-restack = bspwm

    override-redirect = false

    scroll-up = next
    scroll-down = prev

    enable-ipc = true

    background = ''${colors.bg}
    foreground = ''${colors.fg}

    font-0 = "JetBrainsMono Nerd Font:style=Regular:size=10;2"
    font-1 = "JetBrainsMono Nerd Font:style=Bold:size=10;2"
    font-2 = "JetBrainsMono Nerd Font:size=19;5"
    font-3 = "Material Design Icons:style=Regular;2"
    font-4 = "Material Icons:style=Regular;2"
    font-5 = "Font Awesome 6 Free Regular:style=Regular;2"

    modules-left = date xwindow
    modules-center = bspwm
    modules-right = filesystem margin xkeyboard margin memory margin cpu margin eth margin tray margin
    #margin session

    cursor-click = pointer

    [bar/external]
    monitor = DP-1
    modules-right = wlan pulseaudio 
    #margin session
    inherit = bar/main

    [settings]
    screenchange-reload = true

    [module/bspwm]
    type = internal/bspwm

    format = <label-state> <label-mode>

    label-focused = %index%
    label-focused-foreground = ''${colors.shade-5}
    label-focused-padding = 2

    label-occupied = %index%
    label-occupied-foreground = ''${colors.shade-3}
    label-occupied-padding = 2

    label-empty = %index%
    label-empty-foreground = ''${colors.shade-1}
    label-empty-padding = 2

    [module/date]
    type = internal/date
    interval = 1

    time = "%a, %b %d %H:%M"

    format = <label>
    format-foreground = ''${colors.fg}
    format-padding = 1
    format-prefix = %{T5}%{T-}
    label = %{T1}%time%%{T-}
    label-padding = 1

    [module/margin]
    type = custom/text

    content = %{T2} %{T-}
    content-foreground = ''${colors.trans}

    [module/xworkspaces]
    type = internal/xworkspaces

    label-active = %name%
    label-active-background = ''${colors.bg-alt}
    label-active-underline= ''${colors.shade-5}
    label-active-padding = 1

    label-occupied = %name%
    label-occupied-padding = 1

    label-urgent = %name%
    label-urgent-background = ''${colors.shade-5}
    label-urgent-padding = 1

    label-empty = %name%
    label-empty-foreground = ''${colors.shade-1}
    label-empty-padding = 1

    [module/xwindow]
    type = internal/xwindow
    label = %title:0:60:...%

    [module/filesystem]
    type = internal/fs
    interval = 25

    mount-0 = /

    label-mounted = %{F#F0C674}%mountpoint%%{F-} %percentage_used%%

    label-unmounted = %mountpoint% not mounted
    label-unmounted-foreground = ''${colors.shade-1}

    [module/memory]
    type = internal/memory
    interval = 2
    format-prefix = "󰘚 "
    format-prefix-foreground = ''${colors.shade-5}
    label = %percentage_used:2%%

    [module/cpu]
    type = internal/cpu
    interval = 2
    format-prefix = " "
    format-prefix-foreground = ''${colors.shade-5}
    label = %percentage:2%%

    [network-base]
    type = internal/network
    interval = 5
    format-connected = <label-connected>
    format-disconnected = <label-disconnected>
    label-disconnected = %{F#F0C674}%ifname%%{F#707880} disconnected

    [module/eth]
    inherit = network-base
    interface-type = wired
    label-connected = %{F#F0C674}%ifname%%{F-} %local_ip%

    [module/tray]
    type = internal/tray
  '';
}
