{pkgs, ...}: {
  stylix.enable = true;

  # catppuccin-mocha.yaml, rose-pine.yaml, tokyo-night-dark.yaml, tokyo-night-moon.yaml or tokyo-night-storm.yaml
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
  stylix.image = ../wallpapers/shaded.png;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font Mono";
    };
  };

  stylix.polarity = "dark";
}
