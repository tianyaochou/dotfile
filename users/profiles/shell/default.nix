{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = with pkgs; [
      {
        name = "done";
        src = fishPlugins.done;
      }
      {
        name = "tide";
        src = fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "main";
          sha256 = "6ys1SEfcWO0cRRNawrpnUU9tPJVVZ0E6RcPmrE9qG5g=";
        };
      }
      {
        name = "autopair.fish";
        src = fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "main";
          sha256 = "l6WJ2kjDO/TnU9FSigjxk5xFp90xl68gDfggkE/wrlM=";
        };
      }
    ];

    shellInit = ''
      fish_add_path $HOME/.ghcup/bin
      fish_add_path $HOME/.emacs.d/bin
      fish_add_path $HOME/.cargo/bin
      source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';

    interactiveShellInit = ''
      set --global tide_character_symbol λ
      set --global VISUAL "emacs"
      set --global EDITOR $VISUAL
    '';
  };

  programs.zoxide.enable = true;
  programs.skim.enable = true;
}
