{ config, lib, pkgs, self, ... }:

{
  # This is just a representation of the nix default
  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

  environment = {

    # Selection of sysadmin tools that can come in handy
    systemPackages = with pkgs; [
      dosfstools
      gptfdisk
      iputils
      usbutils
      utillinux
    ];

    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable; in
      {
        # nix
        nrb = ifSudo "sudo nixos-rebuild";

        # fix nixos-option for flake compat
        nixos-option = "nixos-option -I nixpkgs=${self}/lib/compat";

        # systemd
        ctl = "systemctl";
        stl = ifSudo "s systemctl";
        utl = "systemctl --user";
        ut = "systemctl --user start";
        un = "systemctl --user stop";
        up = ifSudo "s systemctl start";
        dn = ifSudo "s systemctl stop";
        jtl = "journalctl";
      };
  };

  nix = {
    # Improve nix store disk usage
    autoOptimiseStore = true;
    optimise.automatic = true;
    allowedUsers = [ "@wheel" ];
  };

  # For rage encryption, all hosts need a ssh key pair
  services.openssh = {
    enable = true;
    openFirewall = lib.mkDefault false;
  };

  # Service that makes Out of Memory Killer more effective
  services.earlyoom.enable = true;

}
