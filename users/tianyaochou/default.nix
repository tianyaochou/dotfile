{ pkgs, hmUsers, ... }:

{

  users.users.tianyaochou = {
    name = "tianyaochou";
    home = "/Users/tianyaochou";
  };

  home-manager.users.tianyaochou = {pkgs, ...}: {
    programs.zoxide.enable = true;
    #programs.zsh.enable = true;
    #programs.git.
  };

}
