{
  pkgs,
  lib,
  self,
  system,
  ...
}:
{
  extraPackages = lib.optionals pkgs.stdenv.isDarwin [
    pkgs.jq
    pkgs.ruby
    pkgs.pipx
    pkgs.xcbeautify
  ];

  extraPlugins = [
    self.packages.${system}.xcodebuild-nvim
  ];

  extraConfigLua = # Lua
    ''
      require("lz.n").load({ "wojciech-kulik/xcodebuild.nvim" })
    '';
}
