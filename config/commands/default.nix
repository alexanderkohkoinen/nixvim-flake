{
  imports = [
    ./editor.nix
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
      desc = "Auto format nix files";
      event = "FileType";
      pattern = [ "nix" ];
      callback.__raw = # Lua
        ''
          function()
            vim.b.autoformat = true;
          end
        '';
    }
  ];
}
