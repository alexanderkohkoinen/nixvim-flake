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
                    options = {
                        icons_enabled = true;
                        globalstatus = true;
                        theme = "rose-pine";

                    };
                };
            };
        };

    };
}
