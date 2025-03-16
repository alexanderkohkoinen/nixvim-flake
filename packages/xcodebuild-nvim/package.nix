{
  pkgs,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  pname = "xcodebuild-nvim";
  version = "6.1.0";
  src = pkgs.fetchFromGitHub {
    version = "6.1.0";
    owner = "wojciech-kulik";
    repo = "xcodebuild.nvim";
    rev = "v6.1.0";
    sha256 = "1nam56lzmpv4mnakqnyb4bhzx8vg66mzacd0nhd2y91svb9zkdbn";
  };
  meta.homepage = "https://github.com/wojciech-kulik/xcodebuild.nvim/";

  dependencies = [ pkgs.vimPlugins.nui ];
}
