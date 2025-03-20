{
  pkgs,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  pname = "ale-nvim";
  version = "2025-03-20";
  src = pkgs.fetchFromGitHub {
    owner = "dense-analysis";
    repo = "ale";
    rev = "neovim-lsp-api"; # TODO: Change this to master after it has been merged
    sha256 = "1hv1n6vpjd654ic6gjf30i0sslgvwyjmmv2vncqw0v394k9090y9";
  };
  meta.homepage = "https://github.com/dense-analysis/ale/";
}
