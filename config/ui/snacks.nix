{
    plugins.snacks = {
        lazyLoad = {
            enable = true;
            settings = {
                event = "DeferredUIEnter";

                notifier = {
                    enabled = true;
                    top_down = false;
                };

                statuscolumn = {
                    enabled = true;
                };


                picker = {
                    sources = {
                        explorer = {};
                    };
                };
            };
        };
    };
}
