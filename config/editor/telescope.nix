{
    plugins.telescope = {
        enable = true;
        extensions = {

            file-browser = {
                enable = true;
                settings = {
                    hidden = true;
                };
            };

        };


        highlightTheme = "Rose Pine";

        lazyLoad = {
            enable = true;
            settings = {
                cmd = [ "Telescope" "Noice telescope" ];
                defaults = {
                    file_ignore_patterns = [
                        "^.git/"
                        "^output/"
                        "^target/"
                    ];
                };
            };
        };
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader><space>";
            action = "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>";
            options.desc = "Find Files";
        }
        {
            mode = "n";
            key = "<leader>/";
            action = "<cmd>lua require('telescope.builtin').live_grep({hidden = true})<CR>";
            options.desc = "Grep Files";
        }
        {
            mode = "n";
            key = "<leader>bl";
            action = "<cmd>lua require('telescope.builtin').buffers()<CR>";
            options.desc = "Find Buffer";
        }
        {
            mode = "n";
            key = "<leader>dd";
            action = "<cmd>lua require('telescope.builtin').diagnostics()<CR>";
            options.desc = "Find Diagnostics";
        }
        # {
        #     mode = "n";
        #     key = "<leader>tr";
        #     action = "<cmd>lua require('telescope.builtin').treesitter()<CR>";
        #     options.desc = "Find Treesitter";
        # }
        # {
        #     mode = "n";
        #     key = "<leader>tfm";
        #     action = "<cmd>lua require('telescope.builtin').marks()<CR>";
        #     options.desc = "Find Marks";
        # }
    ];
}
