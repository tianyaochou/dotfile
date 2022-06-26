{ self, pkgs, config, hmUsers, lib, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
in
{
  users.users.tianyaochou = {
    name = "tianyaochou";
    home = "/Users/tianyaochou";
  };

  age.secrets."v2ray/jms.json".file = "${self}/secrets/v2ray/jsm.json";

  home-manager.users.tianyaochou = { pkgs, ... }: {
    programs.zoxide.enable = true;
    #programs.zsh.enable = true;
    programs.starship.enable = true;
    #programs.git.

    home.file = lib.mkIf isDarwin {
      ".ssh/config".text = ''
        Host *
          UseKeychain yes
          AddKeysToAgent yes
          IdentityFile ~/.ssh/id_rsa
      '';
    };
  };

}
