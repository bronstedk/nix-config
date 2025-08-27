{ pkgs, lib, ... }: {
programs.nvf = {
settings = {vim = {
statusline.lualine.enable =true;
telescope.enable = true;
autocomplete.nvim-cmp.enable = true;
theme = {
enable = true;
};

viAlias = true;
vimAlias = true;

lsp.enable = true;

languages = {
enableTreesitter = true;
enableFormat = true;
nix = {enable = true;
lsp = {
enable = true;
server = "nixd";
};
format.enable = true;
};
};

formatter.conform-nvim = {
enable = true;
setupOpts.formatters_by_ft = {
nix = [ "alejandra" ];
};
};

binds = {
cheatsheet.enable = true;
whichKey= {
enable = true;
# register = {
# 	"<leader>hk"; 
# }
};
};
};};};
}
