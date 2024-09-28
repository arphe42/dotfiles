{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    #hsphfpd.enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
}
