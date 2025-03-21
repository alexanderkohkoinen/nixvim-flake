{
  lib,
  pkgs,
  config,
  ...
}:
{
  plugins = {
    lint = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";

      lintersByFt = {
        bash = [ "shellcheck" ];
        c = [ "clangtidy" ];
        cmake = [ "cmakelint" ];
        cpp = [ "clangtidy" ];
        css = lib.mkIf (!config.plugins.lsp.servers.stylelint_lsp.enable) [ "stylelint" ];
        fish = [ "fish" ];
        go = [ "golangcilint" ];
        html = [ "htmlhint" ];
        java = [ "checkstyle" ];
        javascript = lib.mkIf (!config.plugins.lsp.servers.biome.enable) [ "biomejs" ];
        json = [ "jsonlint" ];
        lua = [ "luacheck" ];
        make = [ "checkmake" ];
        markdown = [ "markdownlint" ];
        rust = [ "clippy" ];
        sh = [ "shellcheck" ];
        sql = [ "sqlfluff" ];
        swift = [ "swiftlint" ];
        typescript = lib.mkIf (!config.plugins.lsp.servers.biome.enable) [ "biomejs" ];
        yaml = [ "yamllint" ];
      };

      linters = {
        biomejs.cmd = lib.getExe pkgs.biome;
        checkmake.cmd = lib.getExe pkgs.checkmake;
        checkstyle.cmd = lib.getExe pkgs.checkstyle;
        clangtidy.cmd = lib.getExe' pkgs.clang-tools "clang-tidy";
        clippy.cmd = lib.getExe pkgs.rust-analyzer;
        cmakelint.cmd = lib.getExe' pkgs.cmake-format "cmake-lint";
        deadnix.cmd = lib.getExe pkgs.deadnix;
        fish.cmd = lib.getExe pkgs.fish;
        golangcilint.cmd = lib.getExe pkgs.golangci-lint;
        htmlhint.cmd = lib.getExe pkgs.htmlhint;
        jsonlint.cmd = lib.getExe pkgs.nodePackages.jsonlint;
        luacheck.cmd = lib.getExe pkgs.luaPackages.luacheck;
        markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
        nix.cmd = lib.getExe' pkgs.nix "nix-instantiate";
        pylint.cmd = lib.getExe pkgs.pylint;
        shellcheck.cmd = lib.getExe pkgs.shellcheck;
        sqlfluff.cmd = lib.getExe pkgs.sqlfluff;
        statix.cmd = lib.getExe pkgs.statix;
        stylelint.cmd = lib.getExe pkgs.stylelint;
        yamllint.cmd = lib.getExe pkgs.yamllint;
      };
    };
  };
}
