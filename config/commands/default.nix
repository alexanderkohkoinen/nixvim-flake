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

  ];
}
