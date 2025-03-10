{ 
    imports = [
        ./ai
        ./coding
        ./editor
        ./lang
        ./lsp
        ./treesitter
        ./ui
    ];

    config = {
        globals = {
            mapleader = " ";
            maplocalleader = "\\";
            autoformat = "true";
            # root_lsp_ignore = [ "copilot" ];

            deprecation_warnings = false;
            trouble_lualine = true;
        };

        opts = {
            autowrite = true;
            backup = true;
            clipboard._raw = ''
                vim.env.SSH_TTY and "" or "unnamedplus"
            '';
            completeopt = "menu,menuone,noselect";
            confirm = true;
            cursorline = true;

            foldlevel = 99;

            mouse = "a";

            relativenumber = true;

            scrolloff = 4;
            shiftround = true;
            shiftwidth = 2;
            showmode = false;
            sidescrolloff = 8;
            signcolumn = "yes";
            smartcase = true;
            smartindent = true;
            splitbelow = true;
            splitkeep = "screen";
            splitright = true;

            swapfile = false;
            
            tabstop = 2;

            undofile = true;
            undolevels = 10000;
            updatetime = 200;

            virtualedit = "block";
            
            wildmode = "longest:full,full";
            wrap = false;
        };

        plugins = {
            lz-n.enable = true;
            mini.enable = true;
        };

    };
}
