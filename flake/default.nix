{ inputs, lib, self, ... }:
{
    imports = [
        ./pkgs-by-name.nix
        inputs.nixvim.flakeModules.default
    ];

    nixvim = {
        packages.enable = true;
        checks.enable = true;
    };

    flake.nixvimModules = {
        default = ../config;
    };

    perSystem = { system, config, ... }:
        {
            _module.args.pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };

            nixvimConfigurations = {
                alekohvim = inputs.nixvim.lib.evalNixvim {
                    inherit system;

                    extraSpecialArgs = {
                        inherit inputs system self;
                    };

                    modules = [
                        self.nixvimModules.default
                    ];
                };
            };

            packages.default = config.packages.alekohvim;
        };
}
