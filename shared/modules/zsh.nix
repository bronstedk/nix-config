{lib, ...}: {
  programs.zsh = {
    enable = true;

    initContent = let
      earlyConf = lib.mkOrder 1000 ''
        bindkey -v
      '';

      lastConf = lib.mkOrder 1500 ''
        fastfetch
      '';
    in
      lib.mkMerge [earlyConf lastConf];

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
