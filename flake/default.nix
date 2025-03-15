{ inputs, ... }:
{
  imports = [
    ./nixvim.nix
    ./pkgs-by-name.nix
  ];

  perSystem =
    { config, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      packages.default = config.packages.ale-nvim;
      packages.nvim = config.packages.ale-nvim;
      devShells.default = config.packages.ale-nvim;
    };
}
