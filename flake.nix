{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { nixpkgs, ... }@inputs: let
    supportedSystems = [ "x86_64-linux" ];
  in {
    packages = nixpkgs.lib.genAttrs supportedSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      mpv-remote = pkgs.callPackage ./nix-packages/mpv-remote.nix {};
      mpv-remote-script = pkgs.callPackage ./nix-packages/script.nix { inherit mpv-remote; };
    });
  };
}
