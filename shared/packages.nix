{pkgs, ...}:
with pkgs; [
  # jetbrains.idea-community-src
  black
  isort
  kotlin
  kotlin-native
  kotlin-language-server
  zulu24
  jetbrains.idea-community-bin
  neovim
  jujutsu
  git
  eza
  fd
  fzf
  bat
  ripgrep
  alejandra
]
