{ pkgs, lib, ... }: {
	programs.nixvim = {
          enable = true;

          imports = [
            ./nvim/options.nix
            ./nvim/keymaps.nix
            ./nvim/autocmds.nix
            ./nvim/diagnostic.nix
            ./nvim/plugins/kickstart/gitsigns.nix
          ];

		colorschemes.catppuccin.enable = true;
                plugins = {
                  lualine.enable = true;
                  guess-indent.enable = true;
                };

		extraPlugins = with pkgs.vimPlugins; [
			vim-nix
		];
	};
}
