{
    plugins.snacks.lazyLoad = {
        settings = {
            explorer.enabled = true;
        };
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>e";
            action = ''<cmd>lua snacks.explorer()<cr>'';
            options = {
                desc = "file explorer";
            };
        }

        {
            mode = "n";
            key = "<leader>fe";
            action = ''<cmd>lua snacks.explorer()<cr>'';
            options = {
                desc = "file explorer";
            };
        }
    ];
}
