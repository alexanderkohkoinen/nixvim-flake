{
    plugins.snacks = {
        enable = true;

        settings = {
            indent.enabled = true;
            scroll.enabled = true;



            gitbrowse.enabled = true;
            lazygit.enabled = true;

            notifier = {
                enabled = true;
                top_down = false;
            };

            statuscolumn = {
                enabled = true;
                folds = {
                    open = true;
                    git_hl = true;
                };
            };


            picker = {
                layouts = {
                    select = {
                        relative = "cursor";
                        width = 70;
                        min_width = 0;
                        row = 1;
                    };
                };
            };
        };
    };


    keymaps = [
        {
            mode = "n";
            key = "<leader>go";
            action = "<cmd>lua Snacks.gitbrowse()<CR>";
            options = {
                desc = "Open file in browser";
            };
        }
        {
            mode = "n";
            key = "<leader>gg";
            action = "<cmd>lua Snacks.lazygit()<CR>";
            options = {
                desc = "Open lazygit";
            };
        }
    ];
}
