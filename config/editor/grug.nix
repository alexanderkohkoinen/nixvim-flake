{
    plugins.grug-far = {
        enable = true;
        lazyLoad = {
            settings = {
                cmd = "GrugFar";
                headerMaxWidth = 80;
                minSearchChars = 2;
                keys = [
                    {
                        __unkeyed-1 = "<leader>sr";
                        __unkeyed-2.__raw = ''
              function()
                local grug = require('grug-far')
                local ext = vim.bo.buftype == "" and vim.fn.expand('%:e')
                grug.open({
                    transient = true,
                    prefills = {
                        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                    },
                })
              end
                        '';
                        desc = "Search and replace";
                    }
                ];
            };
        };
    };
}
