{
  plugins.snacks = {
    settings = {
      notifier = {
        enabled = true;
        top_down = true;
        # style = "minimal";
        timeout = 2000;
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
        ''function() Snacks.notifier.hide() end'';
      options.desc = "Dismiss all Notifications";
    }

  ];

}
