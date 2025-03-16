{
  pkgs,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  pname = "xcodebuild-nvim";
  version = "6.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "wojciech-kulik";
    repo = "xcodebuild.nvim";
    tag = "v6.1.0";
    hash = "sha256-GJChZm1AWyjubnKHbgvnq+hkTMAgPVeHlzFs+JZAKAM=";
  };

  dependencies = [ pkgs.vimPlugins.nui-nvim ];

  nvimSkipModule = [
    "xcodebuild.ui.pickers"
    "xcodebuild.actions"
    "xcodebuild.project.manager"
    "xcodebuild.project.assets"
    "xcodebuild.integrations.xcode-build-server"
    "xcodebuild.integrations.dap"
    "xcodebuild.dap"
  ];
}
