{ ... }: {
           globals = {
            maplocalleader = " ";
            mapleader = " ";
            have_nerd_font = true;
          };

          opts = {
          number = true;
          relativenumber = true;

          mouse = "a";

          showmode = false;

          undofile = true;

          ignorecase = true;
          smartcase = true;

          signcolumn = "yes";

          update_time = 250;

          timeoutlen = 300;

          splitright = true;
          splitbelow = true;

          list = true;
          listchars.__raw = "{ tab = '» ', trail = '.', nbsp = '␣'}";

          inccommand = "split";

          cursorline = true;

          scrolloff = 10;

          hlsearch = true;

          shiftwidth = 2;
          };
 
}
