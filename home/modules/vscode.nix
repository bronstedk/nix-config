{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.main = {
      extensions = with pkgs.vscode-extensions; [
        kamadorueda.alejandra
        jnoortheen.nix-ide
        vscodevim.vim
        ms-python.debugpy
        ms-python.mypy-type-checker
        ms-python.python
        redhat.vscode-yaml
        thenuprojectcontributors.vscode-nushell-lang
      ];
    };
  };
}
