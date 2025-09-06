{config, ...}: let
  secrets = import ../../secrets/jj.nix;
  user = secrets.user;
  key = secrets.key;
in {
  programs.jujutsu = {
    enable = true;
    ediff = config.programs.neovim.enable;

    settings = {
      inherit user;

      ui = {
        default-command = "log";
        diff-editor = ":builtin";
      };

      signing = {
        behavior = "keep";
        backend = "gpg";
        backends.gpg.program = "gpg2";
        inherit key;
      };

      git.sign-on-push = true;
    };
  };
}
