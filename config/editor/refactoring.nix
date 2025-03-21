{
  lib,
  config,
  ...
}:
{
  plugins.refactoring = {
    enable = true;
    lazyLoad.settings = {
      event = "DeferredUIEnter";

      before = lib.mkIf config.plugins.telescope.enable {
        __raw = ''
          require('lz.n').trigger_load('telescope')
        '';
      };
      cmd = "Refactor";
      keys = lib.mkIf config.plugins.telescope.enable [
        {
          __unkeyed-1 = "<leader>fR";
          __unkeyed-2.__raw = ''
            function()
              require('telescope').extensions.refactoring.refactors()
            end
          '';
          desc = "Find Refactoring";
        }
      ];
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed = "<leader>r";
      group = "refactor";
      icon = " ";
    }
  ];

  keymaps = [
    {
      mode = "x";
      key = "<leader>re";
      action = "<cmd>Refactor extract<cr>";
      options = {
        desc = "Extract";
      };
    }
    {
      mode = "x";
      key = "<leader>rE";
      action = "<cmd>Refactor extract_to_file<cr>";
      options = {
        desc = "Extract to file";
      };
    }
    {
      mode = "x";
      key = "<leader>rv";
      action = "cmd>Refactor extract_var<cr>";
      options = {
        desc = "Extract var";
      };
    }
    {
      mode = "n";
      key = "<leader>ri";
      action = "<cmd>Refactor inline_var<CR>";
      options = {
        desc = "Inline var";
      };
    }
    {
      mode = "n";
      key = "<leader>rI";
      action = "<cmd>Refactor inline_func<CR>";
      options = {
        desc = "Inline Func";
      };
    }
    {
      mode = "n";
      key = "<leader>rb";
      action = "<cmd>Refactor extract_block<CR>";
      options = {
        desc = "Extract block";
      };
    }
    {
      mode = "n";
      key = "<leader>rB";
      action = "<cmd>Refactor extract_block_to_file<CR>";
      options = {
        desc = "Extract block to file";
      };
    }
  ];
}
