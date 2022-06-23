{ config, lib, pkgs, suites, ... }:

{
  imports =
    suites.server ++
    [
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "terraria";
  time.timeZone = "Europe/Amsterdam";

  users.users.tianyaochou = {
    isNormalUser = true;
    extraGroups = [ "wheel" "terraria" ]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
    packages = with pkgs; [
    ];
    openssh = {
      authorizedKeys.keyFiles =
        let keyFilePath = pkgs.fetchurl {
          url = "https://github.com/tianyaochou.keys";
          sha256 = "87e310064922f509efff3bd298159a4d86480534d2d6e649405b068cad012e93";
        };
        in [keyFilePath];
    };
  };
  users.users.terraria.group = "terraria";
  users.groups.terraria = {};

  programs.tmux.enable = true;

  services = {
    terraria = {
      enable = true;
      openFirewall = true;
      password = "international-china";
      autoCreatedWorldSize = "small";
      worldPath = /var/lib/terraria/.local/share/Terraria/Worlds/IC.wld;
    };
  };

  system.stateVersion = "22.05";
}
