{
  plugins.mini.lazyLoad = {
    enable = true;
    settings.event = "DeferredUIEnter";
  };

  plugins.mini.mockDevIcons = true;

  plugins.mini.modules.animate = {
    scroll = {
      timing.__raw = ''require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }) '';
      subscroll.__raw = # Lua
        ''
          require('mini.animate').gen_subscroll.equal({
              predicate = function(total_scroll)
                if vim.g.mouse_scrolled then
                  vim.g.mouse_scrolled = false
                  return false
                end
                return total_scroll > 1
              end,
            })'';
    };
  };

  plugins.mini.modules.files = {
    windows = {
      preview = true;
      width_focus = 50;
      width_preview = 50;
    };

    options = {
      use_as_default_explorer = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>";
      key = "<leader>fm";
      options.desc = "Open mini.files (Directory of current file)";
    }
    {
      mode = "n";
      action = "<cmd>lua MiniFiles.open(vim.uv.cwd())<CR>";
      key = "<leader>fM";
      options.desc = "Open mini.files (CWD)";
    }
  ];

  plugins.mini.modules.icons = { };

  plugins.mini.modules.starter = {
    content_hooks = {
      "__unkeyed-1.adding_bullet" = {
        __raw = "require('mini.starter').gen_hook.adding_bullet()";
      };
      "__unkeyed-2.indexing" = {
        __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
      };
      "__unkeyed-3.padding" = {
        __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
      };
    };
    evaluate_single = true;
    header = ''
      ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
      ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
      ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
    '';
    items = {
      "__unkeyed-1.buildtin_actions" = {
        __raw = "require('mini.starter').sections.builtin_actions()";
      };
      "__unkeyed-2.recent_files_current_directory" = {
        __raw = "require('mini.starter').sections.recent_files(10, false)";
      };
      "__unkeyed-3.recent_files" = {
        __raw = "require('mini.starter').sections.recent_files(10, true)";
      };
      "__unkeyed-4.sessions" = {
        __raw = "require('mini.starter').sections.sessions(5, true)";
      };
    };
  };
  extraConfigLua = ''
    -- Detect mouse scroll events
    local mouse_keys = { "Up", "Down" }
    for _, scroll in ipairs(mouse_keys) do
      local key = "<ScrollWheel" .. scroll .. ">"
      vim.keymap.set({ "", "i" }, key, function()
        vim.g.mouse_scrolled = true
        return key
      end, { expr = true })
    end
  '';

}
