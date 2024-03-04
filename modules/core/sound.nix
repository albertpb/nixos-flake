{ config, pkgs, ... }:
let
  json = pkgs.formats.json { };
  pw_rnnoise_config = {
    "context.modules" = [
      {
        "name" = "libpipewire-module-filter-chain";
        "args" = {
          "node.description" = "Noise Canceling source";
          "media.name" = "Noise Canceling source";
          "filter.graph" = {
            "nodes" = [
              {
                "type" = "ladspa";
                "name" = "rnnoise";
                "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                "label" = "noise_suppressor_stereo";
                "control" = {
                  "VAD Threshold (%)" = 50.0;
                  "VAD Grace Period (ms)" = 200;
                  "Retroactive VAD Grace (ms)" = 0;
                };
              }
            ];
          };
          "capture.props" = {
            "node.name" = "capture.rnnoise_source";
            "node.passive" = true;
            "audio.rate" = 48000;
          };
          "playback.props" = {
            "node.name" = "audio.rate = 48000";
            "media.class" = "Audio/Source";
            "audio.rate" = 48000;
          };
        };
      }
    ];
  };
in
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    jack.enable = true;
  };

  environment.etc =
    let
      json = pkgs.formats.json { };
    in
    {
      "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
        		bluez_monitor.properties = {
        			["bluez5.enable-sbc-xq"] = true,
        			["bluez5.enable-msbc"] = true,
        			["bluez5.enable-hw-volume"] = true,
        			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
        		}
        	'';

      "pipewire/pipewire.conf.d/99-input-denoising.conf" = {
        source = json.generate "99-input-denoising.conf" pw_rnnoise_config;
      };

      "pipewire/pipewire.conf.d/92-low-latency.conf".source = json.generate "92-low-latency.conf"
        {
          context.properties = {
            default.clock.rate = 48000;
            default.clock.allowed-rates = [ 44100 48000 96000 192000 ];
            default.clock.quantum = 32;
            default.clock.min-quantum = 32;
            default.clock.max-quantum = 32;
          };
        };

      "pipewire/pipewire.conf.d/93-pulse.conf".source = json.generate "93-pulse.conf"
        {
          context.modules = [
            {
              name = "libpipewire-module-protocol-pulse";
              args = {
                pulse.min.req = "32/48000";
                pulse.default.req = "32/48000";
                pulse.max.req = "32/48000";
                pulse.min.quantum = "32/48000";
                pulse.max.quantum = "32/48000";
              };
            }
          ];
          stream.properties = {
            node.latency = "32/48000";
            resample.quality = 1;
          };
        };
    };
}
