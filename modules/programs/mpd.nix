{ pkgs, lib, ... }:

{
  services.mpd = {
    enable = true;

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
  services.mpd-discord-rpc.enable = true;
  services.listenbrainz-mpd = {
    enable = true;
    settings.submission.token_file = nixosConfig.age.secrets."listenbrainz-token".path;
  };

  programs.ncmpcpp = {
    enable = true;
  };
}
