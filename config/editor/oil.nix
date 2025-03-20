{
  plugins.oil = {
    enable = true;
  };


  keymaps = [
      {
        mode = "n";
        action = "<CMD>Oil --float<CR>";
        key = "<leader>o";
        options.desc = "Open oil";
        options.silent = true;
      }
  ];
}
