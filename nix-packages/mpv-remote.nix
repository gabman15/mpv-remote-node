{
  buildNpmPackage
}: buildNpmPackage rec {
  pname = "remote-server";
  version = "1.0.8";
  src = ../.;
  npmDepsHash = "sha256-JeKO+gyhonQOM/t421BhVT0svdEePxvqp94gwMV69Pk=";
  dontNpmBuild = true;
  npmPackFlags = [ "--ignore-scripts" ];
}
