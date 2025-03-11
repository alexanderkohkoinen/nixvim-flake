{
    plugins.snacks.lazyLoad = {
        enable = true;

        settings = {
            event = "DeferredUIEnter";
            bigfile = {
                enabled = true;
                notify = true;
            };


            gitbrowse.enabled = true;
            lazygit.enabled = true;

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
