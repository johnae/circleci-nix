with import <nixpkgs> {};
with lib;
with builtins;
with callPackage ./helpers.nix { };

let
  config = import ./config.nix { inherit lib; };

in

  stdenv.mkDerivation {

    name = "test";
    buildInputs = with build-tools; [];
    shellHook = ''
    set -euo pipefail

    ${toMultiLineString config (
          key: value:
               ''export ${key}=${value}''
    )}

    '';

  }