{
  keymaps = [

    # Tabs
    {
      mode = "n";
      action = "<CMD>tablast<CR>";
      key = "<leader><tab>l";
      options.desc = "Last tab";
    }
    {
      mode = "n";
      action = "<CMD>tabonly<CR>";
      key = "<leader><tab>o";
      options.desc = "Close Other tabs";
    }
    {
      mode = "n";
      action = "<CMD>tabfirst<CR>";
      key = "<leader><tab>f";
      options.desc = "First tab";
    }
    {
      mode = "n";
      action = "<CMD>tabnew<CR>";
      key = "<leader><tab><tab>";
      options.desc = "New Tab";
    }
    {
      mode = "n";
      action = "<CMD>tabnext<CR>";
      key = "<leader><tab>]";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      action = "<CMD>tabclose<CR>";
      key = "<leader><tab>d";
      options.desc = "Close Tab";
    }
    {
      mode = "n";
      action = "<CMD>tabprevious<CR>";
      key = "<leader><tab>[";
      options.desc = "Previous Tab";
    }

    # Windows
    {
      mode = "n";
      action = "<C-W>s";
      key = "<leader>w-";
      options = {
        remap = true;
        desc = "Split Window Below";
      };
    }
    {
      mode = "n";
      action = "<C-W>v";
      key = "<leader>w|";
      options = {
        remap = true;
        desc = "Split Window Right";
      };
    }
    {
      mode = "n";
      action = "<C-W>c";
      key = "<leader>wd";
      options = {
        remap = true;
        desc = "Delete Window";
      };
    }

  ];

}
