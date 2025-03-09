{ pkgs, ... }:
{
    plugins.lsp = {
        lazyLoad = {
            enable = true;
        };

        servers = {
            bashls.enable = true;
            clangd.enable = true;
            cmake.enable = true;
            html.enable = true;
            jsonls.enable = true;
            lua-ls.enable = true;
            nixd.enable = true;
            yamlls.enable = true;
        };
    };
}
