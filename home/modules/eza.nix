{...}: {
  programs.eza = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    git = true;
    icons = "always";
    colors = "always";
  };
}
