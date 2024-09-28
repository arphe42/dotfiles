# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3029e21c-7339-4407-8ae8-47273f201e3b";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/1286-06CD";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/be5c6c4d-8fc8-486b-be57-bc3a80a375be"; }
    ];

  # the 500GB SSD
  fileSystems."/home/raphael/disk/ssd" =
    { device = "/dev/disk/by-uuid/a9d66443-9e6b-4c98-b48f-2a11fd523aac";
      fsType = "ext4";
    };

  # 1TB SSD primary game
  fileSystems."/home/raphael/disk/game" =
    { device = "/dev/disk/by-uuid/2ff7f83c-0127-442d-88f5-13fa65911e8f";
      fsType = "ext4";
    };

    fileSystems."/home/raphael/Storage/Truenas" = {
      device = "truenas:/mnt/SplishSplash/raphael";
      fsType = "nfs";
    };

    fileSystems."/home/raphael/Storage/Emulation" = {
      device = "truenas:/mnt/SplishSplash/Emulation";
      fsType = "nfs";
    };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp36s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
