{ pkgs, ... }:
{
  imports = [
    ./dotnet.nix
    ./rust.nix
  ];

  plugins.lsp = {
    enable = true;
    lazyLoad = {
      settings = {
        inlayHints = true;
        ft = [ "*" ];
      };
    };

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      dockerls.enable = true;
      html.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd.enable = true;
      pylsp.enable = true;
      ruff.enable = true;
      sqls.enable =true;
      tailwindcss.enable =true;
      ts_ls.enable = true;
      yamlls.enable = true;
    };

  };

  plugins.lsp-format = {
    enable = true;
    lazyLoad.settings.ft = [ "nix" ];
  };

  plugins.lsp-lines = {
    enable = true;
    lazyLoad.settings.ft = [ "*" ];
  };

  plugins.lsp-signature = {
    enable = true;
    lazyLoad.settings.ft = [ "*" ];
  };

}
