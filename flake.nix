{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            bc
            gcc
            pkg-config
            ncurses
            flex
            openssl
            dtc
            bison
            elfutils
            pkgsCross.arm-embedded.stdenv.cc.bintools
            pkgsCross.arm-embedded.buildPackages.gcc
          ];
        };

      });
}
