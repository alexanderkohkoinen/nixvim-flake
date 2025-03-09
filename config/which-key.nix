{
    plugins.which-key = {
        enable = true;
        autoLoad = true;
    };


    keymaps = [
        {
            action = ''
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end
            '';
            key = "<leader>fm";
            options = {
                desc = "Open mini.files";
            };
        }
        {
            action = ''
                function()
                    require("mini.files").open(vim.uv.cwd(), true)
                end
            '';
            key = "<leader>fM";
            options = {
                desc = "Open mini.files in current directory";
            };
        }
    ];
}
