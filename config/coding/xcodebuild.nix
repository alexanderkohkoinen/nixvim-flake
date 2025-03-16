{
  pkgs,
  lib,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    xcodebuild-nvim
  ];
}
