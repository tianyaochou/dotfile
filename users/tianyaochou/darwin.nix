{ self, config, lib, pkgs, ... }:

{
    home.file = {
      ".ssh/config".text = ''
        Host *
          UseKeychain yes
          AddKeysToAgent yes
          IdentityFile ~/.ssh/id_rsa
      '';
    };
}
