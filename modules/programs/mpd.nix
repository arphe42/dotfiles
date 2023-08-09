{ pkgs, lib, config, ... }:

{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";

      extraConfig = ''
        zeroconf_enabled "no"

        filesystem_charset "UTF-8"

        restore_paused "yes"

        input_cache {
          size "1 GB"
        }

        audio_output {
          type "pipewire"
          name "Primary Audio Stream"
          format "96000:32:2"
        }
      '';
    };
    mpd-discord-rpc = {
      enable = true;
    };
  };
}
