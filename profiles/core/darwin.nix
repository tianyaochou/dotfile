{ self, config, lib, pkgs, ... }:

{
  imports = [];

  # Recreate /run/current-system symlink after boot
  services.activate-system.enable = true;

  services.nix-daemon.enable = true;
  users.nix.configureBuildUsers = true;

  environment = {

    systemPackages = with pkgs; [
      terminal-notifier
      m-cli
    ];

    shellAliases = {
      nrb = "darwin-rebuild switch --flake";
    };

  };
}
