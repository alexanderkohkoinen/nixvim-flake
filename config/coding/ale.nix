{
  self,
  system,
  ...
}:
{
  extraPlugins = [
    self.packages.${system}.ale-nvim
  ];

  keymaps = [];
}
