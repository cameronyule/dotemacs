{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nurpkgs = {
      url = "github:cameronyule/nurpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nurpkgs,
    flake-utils,
    treefmt-nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        treefmtEval = treefmt-nix.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs = {
            # keep-sorted start
            alejandra.enable = true;
            keep-sorted.enable = true;
            mdformat.enable = true;
            statix.enable = true;
            # keep-sorted end
          };

          settings = {
            allow-missing-formatter = false;
            on-unmatched = "fatal";
            verbose = 2;
            global.excludes = [
              ".editorconfig"
            ];
            formatter = {
              lisp = {
                command = "${nurpkgs.packages.${system}.lisp-format}/bin/lisp-format";
                options = ["-i"];
                includes = ["*.el"];
              };
            };
          };
        };
      in {
        # For `nix fmt`
        formatter = treefmtEval.config.build.wrapper;

        checks = {
          # For `nix flake check`
          formatting = treefmtEval.config.build.check self;
        };
      }
    );
}
