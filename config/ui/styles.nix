{
    colorschemes.rose-pine = {
        enable = true;
        lazyLoad.enable = true;
    };

    plugins = {
        lualine = {
            enable = true;
            lazyLoad = {
                enable = true;
                settings = {
                    event = "DeferredUIEnter";
                    options = {
                        icons_enabled = true;
                        globalstatus = true;
                        theme = "rose-pine";

                        disabled_filetypes = {
                            __unkeyed-1 = "startify";
                            __unkeyed-2 = "neo-tree";
                            __unkeyed-3 = "copilot-chat";
                            __unkeyed-4 = "ministarter";
                            __unkeyed-5 = "Avante";
                            __unkeyed-6 = "AvanteInput";
                            __unkeyed-7 = "trouble";
                            __unkeyed-8 = "dapui_scopes";
                            __unkeyed-9 = "dapui_breakpoints";
                            __unkeyed-10 = "dapui_stacks";
                            __unkeyed-11 = "dapui_watches";
                            __unkeyed-12 = "dapui_console";
                            __unkeyed-13 = "dashboard";
                            __unkeyed-14 = "snacks_dashboard";
                            __unkeyed-15 = "snacks_layout_box";
                            winbar = [
                                "dap-repl"
                                "neotest-summary"
                            ];
                        };
                    };
                };
            };
        };

    };
}
