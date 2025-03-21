{
  imports = [
    ./editor.nix
    ./lsp.nix
    ./mini.nix
  ];

  autoCmd = [
    {
      event = "FileType";
      pattern = [
        "tex"
        "latex"
        "markdown"
      ];
      command = "setlocal spell spelllang=en_us";
    }
    {
      event = "VimResized";
      pattern = [ "*" ];
      callback.__raw = # Lua
        ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
    }


  ];
}
