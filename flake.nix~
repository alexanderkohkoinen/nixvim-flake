{
  description = "Nixvim flake with lazy";
  inputs.nixvim.url = "github:nix-community/nixvim";

  outputs = { self, nixpkgs, nixvim, flake-parts, }@inputs:
  let
    config = import ./config;
  in
  flake-parts.lib.mkFlake {inherit inputs;} {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { pkgs, system, ... }: let
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages."${system}";
      nvim = nixvim'.makeNixvim config;
    in {
      checks = { default = nixvimLib.check.mkTestDerivationFromNvim { inherit nvim; name = "A nixvim configuration"; }; };
      packages = {
        inherit nvim;
        default = nvim;
      };
    };
  };
} 
