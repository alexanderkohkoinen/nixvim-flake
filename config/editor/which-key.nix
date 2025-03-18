{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };

      win = {
        border = "rounded";
        padding = [
          1
          1
        ];
      };

      spec = [
        # General Mappings
        {
          __unkeyed-1 = "<leader>b";
          group = "+buffer";
          mode = [
            "n"
            "v"
          ];
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "+code";
          mode = [
            "n"
            "v"
          ];
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "+find/file";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "+git";
          mode = [
            "n"
            "v"
          ];
        }
        {
          __unkeyed-1 = "<leader>h";
          group = "+harpoon";
          mode = [
            "n"
            "v"
          ];
        }

        {
          __unkeyed-1 = "<leader>q";
          group = "+quit/session";
          mode = "n";
        }

        {
          __unkeyed-1 = "<leader>s";
          group = "+search";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "+ui";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "+windows";
          mode = "n";
        }
      ];
    };
  };
}
