{ pkgs, ... }:
{
    imports = [];

    plugins.lsp = {
        lazyLoad = {
            enable = true;
            settings = {
                event = "VimEnter";
                servers = {
                    bashls.enable = true;
                    clangd.enable = true;
                    cmake.enable = true;
                    html.enable = true;
                    jsonls.enable = true;
                    lua_ls.enable = true;
                    nixd.enable = true;
                    yamlls.enable = true;
                };

            };
        };

    };
}
