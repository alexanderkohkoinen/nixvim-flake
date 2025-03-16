{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        header = ''
           █████╗ ██╗     ███████╗██╗  ██╗ ██████╗ ██╗  ██╗
          ██╔══██╗██║     ██╔════╝██║  ██║██╔═══██╗██║  ██║
          ███████║██║     █████╗  ███████║██║   ██║███████║
          ██╔══██║██║     ██╔══╝  ██╔══██║██║   ██║██╔══██║
          ██║  ██║███████╗███████╗██║  ██║╚██████╔╝██║  ██║
          ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
        '';
        sections = [
          {
            section = "header";
          }
          {
            icon = " ";
            title = "Recent Files";
            __unkeyed-1.__raw = "require('snacks').dashboard.sections.recent_files({cwd = true})";
            pane = 1;
            indent = 1;
            padding = 1;
          }

          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            indent = 1;
            padding = 1;
          }
          {
            pane = 1;
            icon = " ";
            desc = "Browse Repo";
            padding = 1;
            indent = 1;
            key = "b";
            action.__raw = ''
              function()
                Snacks.gitbrowse()
              end'';
          }
          {
            section = "terminal";
            pane = 2;
            cmd = "";
            height = 5;
            padding = 2;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            pane = 2;
            indent = 1;
            padding = 1;
          }

          {
            __raw = ''
              function()
                local in_git = Snacks.git.get_root() ~= nil
                local cmds = {
                  {
                    title = "Open Issues",
                    cmd = "gh issue list -L 3",
                    key = "i",
                    action = function()
                      vim.fn.jobstart("gh issue list --web", { detach = true })
                    end,
                    icon = " ",
                    height = 3,
                    indent = 1,
                  },
                  {
                    icon = " ",
                    title = "Open PRs",
                    cmd = "gh pr list -L 3",
                    key = "p",
                    action = function()
                      vim.fn.jobstart("gh pr list --web", { detach = true })
                    end,
                    height = 3,
                    indent = 1,
                  },
                  {
                    icon = " ",
                    title = "Git Status",
                    cmd = "git --no-pager diff --stat -B -M -C",
                    height = 3,
                    indent = 1,
                  },
                }
                return vim.tbl_map(function(cmd)
                  return vim.tbl_extend("force", {
                    pane = 2,
                    section = "terminal",
                    enabled = in_git,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 1,
                  }, cmd)
                end, cmds)
              end
            '';
          }
        ];
      };
    };
  };
}
