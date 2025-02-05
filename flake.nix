{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { localSystem = { inherit system; }; };
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
	        haskell.compiler.ghc98
	        haskellPackages.hls
          zlib
          gnuplot
          freeglut
        ];
      };
    }
  );
}
