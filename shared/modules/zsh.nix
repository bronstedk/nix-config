{lib, ...}: {
  programs.zsh = {
    enable = true;

    initContent = lib.mkOrder 1000 ''
      bindkey -v
    '';

    enableCompletion = true;
    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "cursor" "root"];
    };

    shellAliases = {
      "ll" = "eza -lha -s name --icons=always --color=always";
      "c" = "clear";
      "v" = "nvim";
      "vi" = "nvim";
      "vim" = "nvim";
    };

    zprof.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "git"
        "command-not-found"
        "golang"
        "gradle"
        "tailscale"
      ];
    };
  };
}
