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
        # {
        #     __unkeyed-1 = "<leader>b";
        #     group = "+buffer";
        #     mode = [ "n" "v" ];
        # }
        {
          __unkeyed-1 = "<leader>c";
          mode = [
            "n"
            "v"
          ];
          group = "+code";
        }
        # {
        #     __unkeyed-1 = "<leader>d";
        #     mode = [ "n" "v" ];
        #     group = "+diagnostics";
        # }

        {
          __unkeyed-1 = "<leader>f";
          mode = "n";
          group = "+find/file";
        }

        {
          __unkeyed-1 = "<leader>g";
          mode = [
            "n"
            "v"
          ];
          group = "+git";
        }

        {
          __unkeyed-1 = "<leader>q";
          mode = "n";
          group = "+quit/session";
        }

        {
          __unkeyed-1 = "<leader>s";
          mode = "n";
          group = "+search";
        }
        {
          __unkeyed-1 = "<leader>u";
          mode = "n";
          group = "+ui";
        }

        {
          __unkeyed-1 = "<leader>w";
          mode = "n";
          group = "+windows";
        }
      ];
    };
  };
}
