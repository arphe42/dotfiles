{ config, pkgs, ... };

{
  networking.firewall.allowedTCPPorts = [
    25565
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
