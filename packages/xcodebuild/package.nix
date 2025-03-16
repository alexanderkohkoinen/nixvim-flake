{
  pkgs,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  pname = "xcodebuild-nvim";
  version = "2025-03-16";
  src = pkgs.fetchFromGitHub {
    version = "6.1.0";
    owner = "wojciech-kulik/";
    repo = "xcodebuild.nvim";
    rev = "v6.1.0";
    sha256 = "NJQGmM0ZjRA/IumbCKJVvDeAfJ/mext4uYRdIgcEaqE=";
  };
  meta.homepage = "https://github.com/wojciech-kulik/xcodebuild.nvim/";

  dependencies = [ pkgs.vimPlugins.nui ];
}
