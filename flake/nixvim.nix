{ inputs, self, ... }:
{
  imports = [
    inputs.nixvim.flakeModules.default
  ];

  nixvim = {
    packages.enable = true;
    checks.enable = true;
  };

  flake.nixvimModules = {
    default = ../config;
  };

  perSystem =
    { system, ... }:
    {
      nixvimConfigurations = {
        kokovim = inputs.nixvim.lib.evalNixvim {
          inherit system;

          extraSpecialArgs = {
            inherit inputs system self;
          };

          modules = [
            self.nixvimModules.default
          ];
        };
      };
    };
}
