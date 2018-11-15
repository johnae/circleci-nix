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

  print-info = writeStrictShellScriptBin "print-info" ''

    echo ""
    echo "---------- Software Versions ------------"
    echo kustomize: $(${kustomize}/bin/kustomize version)
    echo docker: $(${docker}/bin/docker -v)
    echo gcloud: $(${google-cloud-sdk}/bin/gcloud -v)
    echo "-----------------------------------------"
    echo ""

  '';


  shell-init = writeStrictShellScriptBin "shell-init" ''
    echo Init shell
    env
  '';


  stuff-stuff = writeStrictShellScriptBin "stuff-stuff" ''
    echo Doing some stuff
  '';

  cached-packages = writeStrictShellScriptBin "cached-packages" ''
    nix-store -qR \
       $(${which}/bin/which docker) \
       $(${which}/bin/which gcloud) \
       $(${which}/bin/which kustomize)
  '';

}