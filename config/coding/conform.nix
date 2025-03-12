{ lib, pkgs, ... }:
{
    plugins.conform-nvim ={
        enable = true;
        lazyLoad.settings = {
            cmd = [ "ConformInfo" ];
            event = [ "DeferredUIEnter" ];
        };

        luaConfig.pre = ''
            local slow_format_filetypes = {}
        '';

        settings = {
            default_format_opts = {
                lsp_format = "fallback";
            };

            formatters_by_ft = {
                bash = [ "shellcheck" "shellharden" "shfmt" ];
                json = [ "jq" ];
                lua = [ "stylua" ];
                markdown = [ "deno_fmt" ];
                nix = [ "nixfmt" ];
                fish = [ "fish_indent" ];

                "_" = [
                    "squeeze_blanks"
                    "trim_whitespace"
                    "trim_newlines"
                ];
            };

            formatters = {
                jq.command = lib.getExe pkgs.jq;
                nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
                prettierd.command = lib.getExe pkgs.prettierd;
                shellcheck.command = lib.getExe pkgs.shellcheck;
                shellharden.command = lib.getExe pkgs.shellharden;
                shfmt.command = lib.getExe pkgs.shfmt;
                squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
                stylelint.command = lib.getExe pkgs.stylelint;
                stylua.command = lib.getExe pkgs.stylua;
                xmlformat.command = lib.getExe pkgs.xmlformat;
                yamlfmt.command = lib.getExe pkgs.yamlfmt;
            };
        };




    };


    keymaps = [
        {
            mode = [ "n" "v" ];
            action = "<CMD>lua require('conform').format()<CR>";
            key = "<leader>cF";
            options.desc = "Format injected language";
        }
    ];

    autoCmd = [
        # Remove trailing whitespace on save
        {
            event = "BufWrite";
            command = "%s/\\s\\+$//e";
        }
    ];

}
