{ ... }:
{
  imports = [
    ./dotnet.nix
    ./rust.nix
    ./xcodebuild.nix
  ];

  plugins.lsp = {
    enable = true;
    lazyLoad.settings.ft = [ "*" ];

    inlayHints = true;
    servers = {
      bashls.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      dockerls.enable = true;
      html.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd.enable = true;
      pylsp.enable = true;
      ruff.enable = true;
      sqls.enable = true;
      tailwindcss.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
    };

    keymaps = {
      silent = true;
      extra = [
        {
          action.__raw = ''function() Snacks.picker.lsp_definitions() end'';
          mode = "n";
          key = "gd";
          options = {
            silent = true;
            buffer = false;
            # has = "definition";
            desc = "Goto definition";
          };
        }
        {
          action.__raw = ''function() Snacks.picker.lsp_implementations() end'';
          mode = "n";
          key = "gI";
          options = {
            silent = true;
            buffer = false;
            desc = "Goto Implementations";
          };
        }
        {
          action.__raw = ''function() Snacks.picker.lsp_type_definitions() end'';
          mode = "n";
          key = "gy";
          options = {
            silent = true;
            buffer = false;
            desc = "Goto T[y]pe Definition";
          };
        }

        {
          action.__raw = ''function() Snacks.picker.lsp_references() end'';
          mode = "n";
          key = "gr";
          options = {
            silent = true;
            buffer = false;
            desc = "References";
          };
        }

        {
          mode = "n";
          key = "<leader>ca";
          action = "vim.lsp.buf.code_action";
          options.desc = "Code Action";
        }
        {
          mode = "n";
          key = "<leader>cr";
          action = "<CMD>vim.lsp.buf.rename";
          options.desc = "Rename";
        }

      ];
    };
  };

  # plugins.lsp-format = {
  #   enable = true;
  #   lazyLoad.settings.ft = [ "nix" ];
  # };

  plugins.lsp-lines = {
    enable = true;
    lazyLoad.settings.ft = [ "*" ];
  };

  plugins.lsp-signature = {
    enable = true;
    lazyLoad.settings.ft = [ "*" ];
  };

}
