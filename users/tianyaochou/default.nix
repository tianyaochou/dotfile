{ pkgs, hmUsers, ... }:

{

  users.users.tianyaochou = {
    name = "tianyaochou";
    home = "/Users/tianyaochou";
  };

  home-manager.users.tianyaochou = { pkgs, ... }: {
    programs.zoxide.enable = true;
    #programs.zsh.enable = true;
    #programs.git.

    home.file = {
      ".ssh/config".text = ''
        Host *
          UseKeychain yes
          AddKeysToAgent yes
          IdentityFile ~/.ssh/id_rsa
      '';
    };
  };

}
