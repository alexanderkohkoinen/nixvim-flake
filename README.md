# Ale-nvim a nixvim based flake

## Run flake during development

```bash
nix run
nix build
```

## Add flake

```nix
{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        ale-nvim.url = "github:alexanderkohkoinen/nixvim-flake";
    };

    outputs = { self, nixpkgs, alekohvim }: {

        # Add to your system packages or devShell
        # if you want to make it available system-wide
        packages = with nixpkgs; [
            ale-nvim.packages.${system}.default
        ];

        # Or, use in a devShell:
        devShells.default = nixpkgs.mkShell {
            nativeBuildInputs = [ ale-nvim.packages.${system}.default ];
        };
    };
}
