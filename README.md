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

    outputs = { self, nixpkgs, ale-nvim, ... }: {

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
````

### Use with overlay and reference as nvim
```nix
{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        ale-nvim.url = "github:alexanderkohkoinen/nixvim-flake";
    };

    outputs = { self, nixpkgs, ale-nvim, ... }: {
        nixpkgs.overlays = [
            (final: prev: { neovim = ale-nvim.packages.${prev.system}.default; })
        ];
    };
}
