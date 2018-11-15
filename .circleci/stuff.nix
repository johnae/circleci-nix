with import <nixpkgs> {};
with lib;
with builtins;
with callPackage ./helpers.nix { };

let
  config = import ./config.nix { inherit lib; };
  stuff-tools = callPackage ./stuff-tools.nix {
               inherit writeStrictShellScriptBin;
  };

in

  stdenv.mkDerivation {

    name = "stuff";
    buildInputs = with stuff-tools; [
       cached-packages
       stuff-stuff
       shell-init
    ];

    shellHook = ''
    set -euo pipefail

    ${toMultiLineString config (
          key: value:
               ''export ${key}=${value}''
    )}

    shell-init

    '';

  }