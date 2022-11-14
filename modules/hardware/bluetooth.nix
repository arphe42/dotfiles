{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    #hsphfpd.enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services.blueman.enable = true;
}
