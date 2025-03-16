{
  plugins.bufferline =
    let
      mouse = {
        right = # Lua
          "'vertical sbuffer %d'";
        close = # Lua
          ''
            function(bufnum)
              require("mini.bufremove").delete(bufnum)
            end
          '';
      };
    in
    {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        options = {
          mode = "buffers";
          always_show_bufferlines = true;
          close_command.__raw = mouse.close;

          diagnostics = "nvim_lsp";
          diagnostics_indicator = # Lua
            ''
              function(count, level, diagnostics_dict, context)
                local s = ""
                for e, n in pairs(diagnostics_dict) do
                  local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                  if(sym ~= "") then
                    s = s .. " " .. n .. sym
                  end
                end
                return s
              end
            '';

          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              text_align = "center";
              highlight = "Directory";
            }
            {
              filetype = "snacks_layout_box";
            }
          ];
        };
      };
    };

  keymaps = [
    {
      mode = "n";
      action = "<CMD>BufferLineCyclePrev<CR>";
      key = "<S-h>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      action = "<CMD>BufferLineCycleNext<CR>";
      key = "<S-l>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      action = "<CMD>BufferLineMovePrev<CR>";
      key = "[B";
      options.desc = "Move Buffer prev";
    }

    {
      mode = "n";
      action = "<CMD>BufferLineMoveNext<CR>";
      key = "]B";
      options.desc = "Move Buffer next";
    }

  ];

}
