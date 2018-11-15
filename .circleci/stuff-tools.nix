{
  stdenv,
  writeStrictShellScriptBin,
  docker,
  kustomize,
  google-cloud-sdk,
  which,
  ...
 }:

rec {


  shell-init = writeStrictShellScriptBin "shell-init" ''
    echo Init shell
    env
  '';

  stuff-stuff = writeStrictShellScriptBin "stuff-stuff" ''
    echo Doing some stuff
  '';

  cached-packages = writeStrictShellScriptBin "cached-packages" ''
    nix-store -qR ${google-cloud-sdk} ${docker} ${kustomize}
  '';

}