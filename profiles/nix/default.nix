{ config, lib, pkgs, ... }:

let
  inherit (lib) isDarwin;
in
{
  imports = [ ./cachix ];

  environment.nix = {

    # Improve nix store disk usage
    gc.automatic = true;

    # Prevents impurities in builds
    # HACK: Sandbox is not working properly in macOS
    # See https://github.com/NixOS/nixpkgs/issues/116341
    useSandbox = if isDarwin
                 then
                   false
                 else
                   true;

    # Give root user and wheel group special Nix privileges.
    trustedUsers = if isDarwin
                   then
                     [ "@admin" ]
                   else
                     [ "root" "@wheel" ];

    # Generally useful nix option defaults
    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';

  };
}
