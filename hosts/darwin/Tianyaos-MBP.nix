{ config, pkgs, suites, ... }:

{
  imports = with suites;
    base;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
    [
      ripgrep
      emacsMacport
      entr
      ffmpeg
      gh
      opam
      pandoc
      haskellPackages.pandoc-crossref
      rustup
      texlive.combined.scheme-full
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';
  nix.trustedBinaryCaches = [
    "https://nrdxp.cachix.org"
    "https://nix-community.cachix.org"
  ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  programs.zsh.promptInit = "";
  # programs.fish.enable = true;

  services.emacs.enable = true;
  services.emacs.package = pkgs.emacsMacport;

  # Homebrew
  homebrew.enable = true;
  homebrew.cleanup = "uninstall";
  homebrew.brews = [ "antigen"
                     "lux"
                     "ghcup"
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
    "visual-studio-code"
    "vmware-fusion"
    "yesplaymusic"
    "zoom"
    "zotero"
    "motrix"

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

  homebrew.masApps = {
    "1Password 7" = 1333542190;
    Keynote = 409183694;
    Numbers = 409203825;
    Pages = 409201541;
    "Pixelmator Pro" = 1289583905;
    RunCat = 1429033973;
    StopTheMadness = 1376402589;
    OneDrive = 823766827;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
