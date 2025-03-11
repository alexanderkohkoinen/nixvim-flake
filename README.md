### Run flake during development
nix run .#


### Add flake
```
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Or your preferred channel
      alekohvim.url = "github:alexanderkohkoinen/nixvim-flake";
    };

    outputs = { self, nixpkgs, alekohvim }: {
      # ... your other configuration ...

      # Add to your system packages or devShell if you want to make it available system-wide
      packages = with nixpkgs; [
        alekohvim.packages.${system}.default
      ];

      # Or, use in a devShell:
      devShells.default = nixpkgs.mkShell {
        nativeBuildInputs = [ alekohvim.packages.${system}.default ];
      };
    };
