{ self, pkgs, config, hmUsers, lib, suites, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
  username = "tianyaochou";
  email = "tianyaochou@fastmail.com";
in
{
  #age.secrets."jms.json".file = "${self}/secrets/v2ray/jms.json.age";

  users.users.${username} =
    if isDarwin then {
      name = username;
      home = /Users/${username};
      shell = pkgs.fish;
    } else {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      initialPassword = "nixos";
      shell = pkgs.fish;
    };

  home-manager.users.${username} = { pkgs, suites, ... }: {
    imports = suites.base ++ [
      (if isDarwin then ./darwin.nix else ./nixos.nix)
    ];
    home.packages = with pkgs;
      [
        opam
        python310
        rustup
        agda

        agenix

        entr
        ffmpeg
        gh
        pandoc

        haskellPackages.pandoc-crossref
        texlive.combined.scheme-full
        fontconfig
      ] ++ 
      (with python310Packages; [
        pygments
      ]);

    programs.git = {
      userName = username;
      userEmail = email;
    };

    home.file = {
      ".doom.d".source = ./doom.d;
    };
  };

}
