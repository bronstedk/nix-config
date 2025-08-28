{...}: {
  plugins.undotree = {
    enable = true;
    autoLoad = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action.__raw = ''
        function()
          vim.cmd 'UndotreeToggle'
          vim.cmd 'UndotreeFocus'
        end
      '';
    }
  ];
}
