{
  pkgs,
  lib,
  self,
  system,
  ...
}:
{
  extraPackages = lib.optionals pkgs.stdenv.isDarwin [
    pkgs.jq
    pkgs.ruby
    pkgs.pipx
    pkgs.xcbeautify
  ];

  plugins.telescope = {
    enable = pkgs.stdenv.isDarwin;
    lazyLoad.enable = pkgs.stdenv.isDarwin;
    lazyLoad.settings = {
      event = "DeferredUIEnter";
      after.__raw = # Lua
        ''
          require("xcodebuild").setup()
        '';
    };
  };

  extraPlugins = lib.optionals pkgs.stdenv.isDarwin [
    self.packages.${system}.xcodebuild-nvim
  ];

  keymaps = lib.optionals pkgs.stdenv.isDarwin [
    {
      mode = "n";
      key = "<leader>dX";
      action = "<cmd>XcodebuildPicker<cr>";
      options = {
        desc = "Show Xcodebuild Actions";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxf";
      action = "<cmd>XcodebuildProjectManager<cr>";
      options = {
        desc = "Show Project Manager Actions";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxb";
      action = "<cmd>XcodebuildBuild<cr>";
      options = {
        desc = "Build Project";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxB";
      action = "<cmd>XcodebuildBuildForTesting<cr>";
      options = {
        desc = "Build For Testing";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxr";
      action = "<cmd>XcodebuildBuildRun<cr>";
      options = {
        desc = "Build & Run Project";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxt";
      action = "<cmd>XcodebuildTest<cr>";
      options = {
        desc = "Run Tests";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>dxt";
      action = "<cmd>XcodebuildTestSelected<cr>";
      options = {
        desc = "Run Selected Tests";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxT";
      action = "<cmd>XcodebuildTestClass<cr>";
      options = {
        desc = "Run Current Test Class";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dx.";
      action = "<cmd>XcodebuildTestRepeat<cr>";
      options = {
        desc = "Repeat Last Test Run";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxl";
      action = "<cmd>XcodebuildToggleLogs<cr>";
      options = {
        desc = "Toggle Xcodebuild Logs";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxc";
      action = "<cmd>XcodebuildToggleCodeCoverage<cr>";
      options = {
        desc = "Toggle Code Coverage";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxC";
      action = "<cmd>XcodebuildShowCodeCoverageReport<cr>";
      options = {
        desc = "Show Code Coverage Report";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxe";
      action = "<cmd>XcodebuildTestExplorerToggle<cr>";
      options = {
        desc = "Toggle Test Explorer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxs";
      action = "<cmd>XcodebuildFailingSnapshots<cr>";
      options = {
        desc = "Show Failing Snapshots";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxp";
      action = "<cmd>XcodebuildPreviewGenerateAndShow<cr>";
      options = {
        desc = "Generate Preview";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dx<cr>";
      action = "<cmd>XcodebuildPreviewToggle<cr>";
      options = {
        desc = "Toggle Preview";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxd";
      action = "<cmd>XcodebuildSelectDevice<cr>";
      options = {
        desc = "Select Device";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxq";
      action = "<cmd>Telescope quickfix<cr>";
      options = {
        desc = "Show QuickFix List";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>dxx";
      action = "<cmd>XcodebuildQuickfixLine<cr>";
      options = {
        desc = "Quickfix Line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dxa";
      action = "<cmd>XcodebuildCodeActions<cr>";
      options = {
        desc = "Show Code Actions";
        silent = true;
      };
    }
  ];
}
