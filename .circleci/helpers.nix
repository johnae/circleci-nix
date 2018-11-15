{stdenv, lib, writeShellScriptBin, ...}:

with lib;
with builtins;
rec {
  setToStringSep = sep: x: fun: concatStringsSep sep (mapAttrsToList fun x);
  toMultiLineString = setToStringSep "\n";
  writeStrictShellScriptBin = name: content: writeShellScriptBin name ''
  set -euo pipefail
  ${content}
  '';

}
