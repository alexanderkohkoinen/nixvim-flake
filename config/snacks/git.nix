{
  plugins.snacks.settings = {
    gitbrowse.enabled = true;
    lazygit.enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options.desc = "Open file in browser";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options.desc = "Open lazygit";
    }

    {
      mode = "n";
      key = "<leader>gs";
      action = ''<cmd>lua Snacks.picker.git_status()<cr>'';
      options = {
        desc = "Find git status";
      };
    }
  ];
}
