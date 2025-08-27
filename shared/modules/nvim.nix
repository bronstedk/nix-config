{ pkgs, lib, ... }: {
	programs.nixvim = {
          enable = true;

          imports = [
            ./nvim/options.nix
          ];

		colorschemes.catppuccin.enable = true;
		plugins.lualine.enable = true;

		extraPlugins = with pkgs.vimPlugins; [
			vim-nix
		];
	};
}
