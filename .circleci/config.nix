{lib, ...}:

with lib;
with builtins;

rec {
   PROJECT_NAME               = toLower (getEnv "CIRCLE_PROJECT_REPONAME");
   SHORTSHA                   = substring 0 7 (getEnv "CIRCLE_SHA1");
}