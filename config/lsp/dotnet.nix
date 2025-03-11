{ pkgs, config, ... }:
{
    plugins.lsp.servers.csharp_ls = {
        enable = false;
        filetypes = [
            "cs"
        ];
    };
}
