{
  imports = [
    ./ai
    ./coding
    ./completion
    ./dap
    ./editor
    ./lsp
    ./treesitter
    ./ui

    ./snacks

    ./commands
    ./keymaps.nix
  ];

  config = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      autoformat = false;
      # root_lsp_ignore = [ "copilot" ];

      deprecation_warnings = false;
      trouble_lualine = true;
    };

    opts = {
      autowrite = true;
      autoindent = true;

      breakindent = true;
      clipboard = {
        register = "unamedplus";
      };
      completeopt = "menu,menuone,noselect";
      confirm = true;
      cursorline = true;

      expandtab = true;

      foldlevel = 99;

      ignorecase = true;
      linebreak = true;

      mouse = "a";
      mousemodel = "extend";

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
      startofline = true;
      showmatch = true;
      synmaxcol = 240;
      swapfile = false;

      preserveindent = true;

      tabstop = 2;
      termguicolors = true;

      undofile = true;
      undolevels = 10000;
      updatetime = 200;

      virtualedit = "block";

      writebackup = false;
      wildmode = "longest:full,full";
      wrap = false;
    };

    plugins = {
      lz-n.enable = true;
      mini.enable = true;
    };

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

  };
}
