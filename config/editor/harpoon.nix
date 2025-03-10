{
    plugins.harpoon = {
        enable = true;
        menu = { width.__raw = "vim.api.nvim_win_get_width(0) - 4"; };
        saveOnToggle = true;
    };

    keymaps = [
        {
            mode = "n";
            action.__raw = "require('harpoon.mark').add_file";
            key = "<leader>ha";
            options = { 
                silent = true; 
                desc = "Add file to harpoon";
            };
        }
        {
            mode = "n";
            action.__raw = "require('harpoon.ui').toggle_quick_menu";
            key = "<leader>ht";
            options = { 
                silent = true; 
                desc = "Toggle harpoon menu";
            };
        }
        {
            mode = "n";
            action.__raw = "require('harpoon.ui').nav_next";
            key = "<leader>hn";
            options = { 
                silent = true; 
                desc = "Go to next harpoon file";
            };
        }
        {
            mode = "n";
            action.__raw = "require('harpoon.ui').nav_prev";
            key = "<leader>hp";
            options = { 
                silent = true; 
                desc = "Go to previous harpoon file";
            };
        }

    ];
}
