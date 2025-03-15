{ ... }:
{
  imports = [
    ./explorer.nix
    ./input.nix
    ./git.nix
    ./toggle.nix
  ];

  plugins.fzf-lua.lazyLoad = {
    enable = true;
    settings = {
      cmd = "FzfLua";
    };
  };

  plugins.snacks = {
    enable = true;
    # package = self.packages.${system}.snacks-nvim;
    lazyLoad = {
      enable = true;
      settings = {
        event = "DeferredUIEnter";

        indent.enabled = true;
        scroll.enabled = true;

        notifier = {
          enabled = true;
          top_down = false;
        };

        statuscolumn = {
          enabled = true;
          folds = {
            open = true;
            git_hl = true;
          };
        };

        bigfile = {
          enabled = true;
          notify = true;
        };

        picker = {
          layouts = {
            select = {
              relative = "cursor";
              width = 70;
              min_width = 0;
              row = 1;
            };
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>n";
      action.__raw = # lua
        ''
          function()
            if Snacks.config.picker and Snacks.config.picker.enabled then
              Snacks.picker.notifications()
            else
              Snacks.notifier.show_history()
            end
          end
        '';
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>un";
      action.__raw = # lua
        '' function() Snacks.notifier.hide() end'';
      options.desc = "Dismiss all Notifications";
    }
    {
      mode = "n";
      key = "<leader>fa";
      action = ''<cmd>lua Snacks.picker.autocmds()<cr>'';
      options = {
        desc = "Find autocmds";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = ''<cmd>lua Snacks.picker.commands()<cr>'';
      options = {
        desc = "Find commands";
      };
    }
    {
      mode = "n";
      key = "<leader>fC";
      action.__raw = ''
        function()
          require("snacks.picker").files {
            prompt_title = "Config Files",
            cwd = vim.fn.stdpath("config"),
          }
        end
      '';
      options = {
        desc = "Find config files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = ''<cmd>lua Snacks.picker.diagnostics_buffer()<cr>'';
      options = {
        desc = "Find buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fD";
      action = ''<cmd>lua Snacks.picker.diagnostics()<cr>'';
      options = {
        desc = "Find workspace diagnostics";
      };
    }

    {
      mode = "n";
      key = "<leader>fh";
      action = ''<cmd>lua Snacks.picker.help()<cr>'';
      options = {
        desc = "Find help tags";
      };
    }
    # NOTE: prefer the UI but is lot slower
    {
      mode = "n";
      key = "<leader>fk";
      action = ''<cmd>lua Snacks.picker.keymaps()<cr>'';
      options = {
        desc = "Find keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>fO";
      action = ''<cmd>lua Snacks.picker.smart()<cr>'';
      options = {
        desc = "Find Smart (Frecency)";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = ''<cmd>lua Snacks.picker.projects()<cr>'';
      options = {
        desc = "Find projects";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = ''<cmd>lua Snacks.picker.registers()<cr>'';
      options = {
        desc = "Find registers";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = ''<cmd>lua Snacks.picker.lsp_symbols()<cr>'';
      options = {
        desc = "Find lsp document symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>fS";
      action = ''<CMD>lua Snacks.picker.spelling({layout = { preset = "select" }})<CR>'';
      options = {
        desc = "Find spelling suggestions";
      };
    }
    # Moved to todo-comments module since lazy loading wasn't working
    # {
    #   mode = "n";
    #   key = "<leader>ft";
    #   action = ''<cmd>lua Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }})<cr>'';
    #   options = {
    #     desc = "Find TODOs";
    #   };
    # }
    {
      mode = "n";
      key = "<leader>fT";
      action = ''<cmd>lua Snacks.picker.colorschemes()<cr>'';
      options = {
        desc = "Find theme";
      };
    }
    {
      mode = "n";
      key = "<leader>f?";
      action = ''<cmd>lua Snacks.picker.grep_buffers()<cr>'';
      options = {
        desc = "Fuzzy find in open buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>fu";
      action = "<cmd>lua Snacks.picker.undo()<cr>";
      options = {
        desc = "Undo History";
      };
    }
    # Profiler
    {
      mode = "n";
      key = "<leader>X";
      action = ''<cmd>lua Snacks.profiler.toggle()<cr>'';
      options = {
        desc = "Toggle Neovim profiler";
      };
    }
    {
      mode = "n";
      key = "<leader>f'";
      action = ''<cmd>lua Snacks.picker.marks()<cr>'';
      options = {
        desc = "Find marks";
      };
    }
    {
      mode = "n";
      key = "<leader>f/";
      action = ''<cmd>lua Snacks.picker.lines()<cr>'';
      options = {
        desc = "Fuzzy find in current buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>f<CR>";
      action = ''<cmd>lua Snacks.picker.resume()<cr>'';
      options = {
        desc = "Resume find";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ''<cmd>lua Snacks.picker.buffers()<cr>'';
      options = {
        desc = "Find buffers";
      };
    }
    {
      mode = "n";
      key = "<leader><space>";
      action = ''<cmd>lua Snacks.picker.files()<cr>'';
      options = {
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = "<leader>fmp";
      action = ''<cmd>lua Snacks.picker.man()<cr>'';
      options = {
        desc = "Find man pages";
      };
    }
    {
      mode = "n";
      key = "<leader>fo";
      action = ''<cmd>lua Snacks.picker.recent()<cr>'';
      options = {
        desc = "Find old files";
      };
    }
    {
      mode = "n";
      key = "<leader>fq";
      action = ''<cmd>lua Snacks.picker.qflist()<cr>'';
      options = {
        desc = "Find quickfix";
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options = {
        desc = "Live grep";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = ''<cmd>lua Snacks.picker.git_status()<cr>'';
      options = {
        desc = "Find git status";
      };
    }
    # {
    #   mode = "n";
    #   key = "<leader>gS";
    #   action = ''<cmd>lua Snacks.picker.git_stash()<cr>'';
    #   options = {
    #     desc = "Find git stashes";
    #   };
    # }
        {
      mode = "n";
      key = "<leader>fe";
      action = ''<cmd>lua Snacks.explorer.open() cr>'';
      options = {
        desc = "Open snacks tree";
      };
    }

  ];

}
