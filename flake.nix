{
    description = "Nixvim flake with lazy";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs = {
                # Optional inputs removed
                nuschtosSearch.follows = "";
                # Required inputs
                flake-parts.follows = "flake-parts";
                nixpkgs.follows = "nixpkgs";
            };
        };

        pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";

        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        blink-cmp = {
            url = "github:saghen/blink.cmp";
            inputs = {
                flake-parts.follows = "flake-parts";
                nixpkgs.follows = "nixpkgs";
            };
        };

        snacks-nvim = {
            url = "github:folke/snacks.nvim";
            flake = false;
        };
    };

    outputs = { nixvim, flake-parts, ... }@inputs:
        let
            config = import ./config;
        in
            flake-parts.lib.mkFlake { inherit inputs; } {

                systems = [
                    "aarch64-darwin"
                    "aarch64-linux"
                    "x86_64-darwin"
                    "x86_64-linux"
                ];

                imports = [
                    ./flake/pkgs-by-name.nix
                ];


                perSystem = { pkgs, lib, system, ... }: let
                    nixvimLib = nixvim.lib.${system};
                    nixvim' = nixvim.legacyPackages."${system}";
                    nvim = nixvim'.makeNixvim config;
                in {
                    checks = { 
                        default = nixvimLib.check.mkTestDerivationFromNvim 
                            { 
                                inherit nvim; 
                                name = "A nixvim configuration"; 
                            };
                    };

                    packages = {
                        inherit nvim;
                        default = nvim;
                    };
                };
            };
}
