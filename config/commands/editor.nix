{
  autoCmd = [
    # Close filetypes with q
    {
      desc = "Close filetypes with q";
      event = "FileType";
      pattern = [
        "PlenaryTestPopup"
        "checkhealth"
        "dbout"
        "gitsigns-blame"
        "grug-far"
        "help"
        "lspinfo"
        "neotest-output"
        "neotest-output-panel"
        "neotest-summary"
        "notify"
        "qf"
        "spectre_panel"
        "startuptime"
        "tsplayground"
      ];
      callback.__raw = # Lua
        ''
          function(event)
               vim.bo[event.buf].buflisted = false
               vim.schedule(function()
                 vim.keymap.set("n", "q", function()
                   vim.cmd("close")
                   pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
                 end, {
                   buffer = event.buf,
                   silent = true,
                   desc = "Quit buffer",
                 })
               end)
             end
        '';
    }

    # Highlight on yank
    {
      desc = "Highlight on yank";
      event = "TextYankPost";
      pattern = [ "*" ];
      callback.__raw = # Lua
        ''
          function()
            (vim.hl or vim.highlight).on_yank()
          end
        '';
    }

  ];
}
