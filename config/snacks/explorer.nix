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
            action = ''<CMD>lua Snacks.explorer()<CR>'';
            options = {
                desc = "File Explorer";
            };
        }

        {
            mode = "n";
            key = "<leader>fe";
            action = ''<CMD>lua Snacks.explorer()<CR>'';
            options = {
                desc = "File Explorer";
            };
        }
    ];
}
