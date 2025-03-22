{
  stdenvNoCC,
  mpv-remote
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "mpv-remote-node";
  version = "1.0.8";
  src = ../.;
  installPhase = let
    cleanPath = (pkg: builtins.replaceStrings [ "/" ] [ "\\/" ] (builtins.toString pkg));
  in ''
    runHook preInstall

    mkdir -p $out/share/mpv/scripts/mpvremote
    cp -r mpvremote $out/share/mpv/scripts/

    sed -i 's/mpv-remote-remote-server/${cleanPath mpv-remote}\/bin\/mpv-remote-remote-server/' $out/share/mpv/scripts/mpvremote/main.js
    sed -i 's/mpv-remote-watch-list-handler/${cleanPath mpv-remote}\/bin\/mpv-remote-watch-list-handler/' $out/share/mpv/scripts/mpvremote/main.js

    runHook postInstall
  '';

  passthru.scriptName = "mpvremote/main.js";
})
