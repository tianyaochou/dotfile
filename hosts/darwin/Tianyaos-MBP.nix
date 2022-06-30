{ config, pkgs, suites, profiles, ... }:

{
  imports = suites.mbp;

  environment.systemPackages = with pkgs; [
    emacs
  ];

  services.emacs.enable = true;

  programs.fish.enable = true;
  environment.shells = with pkgs; [ fish ];

  # Homebrew
  # disable homebrew install when activating FIXME: does not work
  # system.activationScripts.homebrew.enable = false;
  homebrew.global.brewfile = true;
  homebrew.enable = true;
  homebrew.cleanup = "uninstall";
  homebrew.taps = [ "homebrew/cask" "homebrew/cask-drivers" ];
  homebrew.brews = [
    "antigen"
    "lux"
    "ghcup"
    "gmp"
  ];
  homebrew.casks = [
    "appcleaner"
    "blockblock"
    "iina"
    "keka"
    "mattermost"
    "obsidian"
    "pdf-expert"
    "racket"
    "vmware-fusion"
    "yesplaymusic"
    "zoom"
    "zotero"
    "motrix"

    "blackhole-16ch"

    "logseq"
    "clashx"
    "calibre"
    "discord"
    "docker"
    "drawio"
    "fujifilm-x-raw-studio"
    "google-chrome"
    "logseq"
    "lyx"
    "macdown"
    "neteasemusic"
    "notion"
    "obsidian"
    "texmacs"
  ];

  # HACK: This is sloooooooooooowwwww
  # homebrew.masApps = {
  #   "1Password 7" = 1333542190;
  #   Keynote = 409183694;
  #   Numbers = 409203825;
  #   Pages = 409201541;
  #   "Pixelmator Pro" = 1289583905;
  #   RunCat = 1429033973;
  #   StopTheMadness = 1376402589;
  #   OneDrive = 823766827;
  # };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
