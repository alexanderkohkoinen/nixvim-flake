{
  config,
  lib,
  ...
}:
{
  plugins.mini.modules =
    {
      ai = { };

      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };

      };
    }
    // (
      if !config.plugins.nvim-autopairs.enable then
        {
          pairs = {
            modes = {
              insert = true;
              command = false;
              terminal = false;
            };

          };

        }
      else
        { }
    );
}
