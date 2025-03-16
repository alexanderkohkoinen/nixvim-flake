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

  extraPlugins = lib.optionals pkgs.stdenv.isDarwin [
    self.packages.${system}.xcodebuild-nvim
  ];

  extraConfigLua = # Lua
    ''
      require("lz.n").load({ "wojciech-kulik/xcodebuild.nvim", event = "DeferredUIEnter" })
    '';

  keymaps = lib.optionals pkgs.stdenv.isDarwin [
    {
      mode = "n";
      key = "<leader>X";
      action = "<cmd>XcodebuildPicker<cr>";
      options = {
        desc = "Show Xcodebuild Actions";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xf";
      action = "<cmd>XcodebuildProjectManager<cr>";
      options = {
        desc = "Show Project Manager Actions";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xb";
      action = "<cmd>XcodebuildBuild<cr>";
      options = {
        desc = "Build Project";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xB";
      action = "<cmd>XcodebuildBuildForTesting<cr>";
      options = {
        desc = "Build For Testing";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xr";
      action = "<cmd>XcodebuildBuildRun<cr>";
      options = {
        desc = "Build & Run Project";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>XcodebuildTest<cr>";
      options = {
        desc = "Run Tests";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>xt";
      action = "<cmd>XcodebuildTestSelected<cr>";
      options = {
        desc = "Run Selected Tests";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xT";
      action = "<cmd>XcodebuildTestClass<cr>";
      options = {
        desc = "Run Current Test Class";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>x.";
      action = "<cmd>XcodebuildTestRepeat<cr>";
      options = {
        desc = "Repeat Last Test Run";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>XcodebuildToggleLogs<cr>";
      options = {
        desc = "Toggle Xcodebuild Logs";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xc";
      action = "<cmd>XcodebuildToggleCodeCoverage<cr>";
      options = {
        desc = "Toggle Code Coverage";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xC";
      action = "<cmd>XcodebuildShowCodeCoverageReport<cr>";
      options = {
        desc = "Show Code Coverage Report";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xe";
      action = "<cmd>XcodebuildTestExplorerToggle<cr>";
      options = {
        desc = "Toggle Test Explorer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xs";
      action = "<cmd>XcodebuildFailingSnapshots<cr>";
      options = {
        desc = "Show Failing Snapshots";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xp";
      action = "<cmd>XcodebuildPreviewGenerateAndShow<cr>";
      options = {
        desc = "Generate Preview";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>x<cr>";
      action = "<cmd>XcodebuildPreviewToggle<cr>";
      options = {
        desc = "Toggle Preview";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xd";
      action = "<cmd>XcodebuildSelectDevice<cr>";
      options = {
        desc = "Select Device";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>Telescope quickfix<cr>";
      options = {
        desc = "Show QuickFix List";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>XcodebuildQuickfixLine<cr>";
      options = {
        desc = "Quickfix Line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xa";
      action = "<cmd>XcodebuildCodeActions<cr>";
      options = {
        desc = "Show Code Actions";
        silent = true;
      };
    }
  ];
}
