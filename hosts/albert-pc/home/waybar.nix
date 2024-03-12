{ pkgs, ... }:
{
  home.file.".config/waybar/colors.css".text = ''
    /*
    *
    * Catppuccin Mocha palette
    * Maintainer: rubyowo
    *
    */

    @define-color base   #1e1e2e;
    @define-color mantle #181825;
    @define-color crust  #11111b;

    @define-color text     #cdd6f4;
    @define-color subtext0 #a6adc8;
    @define-color subtext1 #bac2de;

    @define-color surface0 #313244;
    @define-color surface1 #45475a;
    @define-color surface2 #585b70;

    @define-color overlay0 #6c7086;
    @define-color overlay1 #7f849c;
    @define-color overlay2 #9399b2;

    @define-color blue      #89b4fa;
    @define-color lavender  #b4befe;
    @define-color sapphire  #74c7ec;
    @define-color sky       #89dceb;
    @define-color teal      #94e2d5;
    @define-color green     #a6e3a1;
    @define-color yellow    #f9e2af;
    @define-color peach     #fab387;
    @define-color maroon    #eba0ac;
    @define-color red       #f38ba8;
    @define-color mauve     #cba6f7;
    @define-color pink      #f5c2e7;
    @define-color flamingo  #f2cdcd;
    @define-color rosewater #f5e0dc;
  '';

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
      @import "colors.css";

      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: Fira Code, Material Design Icons, JetBrainsMono Nerd Font;
        font-size: 13px;
      }

      window#waybar {
        background: transparent;
        border-bottom: none;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 6px 18px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: @mantle;
        color: @text;
      }

      #workspaces button.active {
        color: @mantle;
        background-color: @teal;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: @mantle;
        background-color: @surface1;
      }

      #workspaces button.urgent {
        background-color: @surface2;
      }

      #memory,
      #custom-power,
      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #clock,
      #tray {
        border-radius: 4px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: @base;
        color: @surface0;
      }

      #custom-power {
        margin-right: 6px;
      }

      #custom-logo {
        padding-right: 7px;
        padding-left: 7px;
        margin-left: 5px;
        font-size: 15px;
        border-radius: 8px 0px 0px 8px;
        color: @blue;
      }

      #memory {
        background-color: @green;
      }
      #battery {
        background-color: @yellow;
      }
      @keyframes blink {
        to {
          background-color: @maroon;
          color: @yellow;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: @red;
        color: @text;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #battery.charging {
        background-color: @green;
      }

      #backlight {
        background-color: @yellow;
      }

      #pulseaudio {
        background-color: @teal;
      }

      #network {
        background-color: @peach;
        padding-right: 17px;
      }

      #clock {
        background-color: @sapphire;
      }

      #custom-power {
        background-color: @teal;
      }


      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: @base;
      }

      tooltip label {
        padding: 5px;
        background-color: @base;
      }
    '';

    settings = [
      {
        height = 42;
        layer = "top";
        position = "top";
        modules-left = [ "custom/logo" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "memory" "network" ];
        "custom/logo" = {
          format = "  ";
          tooltip = false;
          on-click = "rofi -show run";
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            active = "󱓻";
            urgent = "󱓻";
          };
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };
        memory = {
          interval = 5;
          format = "󰍛 {}%";
          max-length = 10;
        };
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "<tt>{calendar}</tt>";
          format-alt = "  {:%a, %d %b %Y}";
          format = "  {:%I:%M %p}";
        };
        network = {
          format-wifi = "{icon}";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          format-ethernet = "󰀂";
          format-alt = "󱛇";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 5;
          nospacing = 1;
        };
        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "󰂰";
          nospacing = 1;
          tooltip-format = "Volume : {volume}%";
          format-muted = "󰝟";
          format-icons = {
            headphone = "";
            default = [ "󰖀" "󰕾" "" ];
          };
          on-click = "pamixer -t";
          scroll-step = 1;
        };
      }
    ];
  };
} 
