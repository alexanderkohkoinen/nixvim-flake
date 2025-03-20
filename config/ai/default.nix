{
  imports = [
    ./copilot-chat.nix
  ];

  plugins.copilot-lua = {
    enable = true;
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
  };
}
