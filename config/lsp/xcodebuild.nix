{
  pkgs,
  lib,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    xcodebuild-nvim
  ];

  extraConfigLua = # Lua
    ''
      require("lz.n").load({ "wojciech-kulik/xcodebuild.nvim", event = "DeferredUIEnter" })
    '';
}
