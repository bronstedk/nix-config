{
  lib,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;

    shellAliases = {
      c = "clear";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      ll = "eza -lha -s name --color=always --icons=always";
      cd = "z";
      cdi = "zi";
    };

    environmentVariables = {
      EDITOR = "nvim";
    };

    loginFile.text = lib.mkIf pkgs.stdenv.isDarwin ''
           $env.__NIX_DARWIN_SET_ENVIRONMENT_DONE = 1

           $env.PATH = $env.PATH ++ [
      $"($env.HOME)/.nix-profile/bin"
      $"/etc/profiles/per-user/($env.USER)/bin"
      "/run/current-system/sw/bin"
      "/nix/var/nix/profiles/default/bin"
           ]

           $env.NIX_PATH = "nixpkgs=flake:nixpkgs:/nix/var/nix/profiles/per-user/root/channels"
           $env.NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt"
           $env.PAGER = "less -R"
           $env.TERMINFO_DIRS = $"($env.HOME)/.nix-profile/share/terminfo:/etc/profiles/per-user/($env.USER)/share/terminfo:/run/current-system/sw/share/terminfo:/nix/var/nix/profiles/default/share/terminfo:/usr/share/terminfo"
           $env.XDG_CONFIG_DIRS = $"($env.HOME)/.nix-profile/etc/xdg:/etc/profiles/per-user/($env.USER)/etc/xdg:/run/current-system/sw/etc/xdg:/nix/var/nix/profiles/default/etc/xdg"
           $env.XDG_DATA_DIRS = $"($env.HOME)/.nix-profile/share:/etc/profiles/per-user/($env.USER)/share:/run/current-system/sw/share:/nix/var/nix/profiles/default/share"

           # Extra initialisation
           $env.NIX_USER_PROFILE_DIR = "/nix/var/nix/profiles/per-user/($env.USER)"
           $env.NIX_PROFILES = "/nix/var/nix/profiles/default /run/current-system/sw /etc/profiles/per-user/($env.USER) ($env.HOME)/.nix-profile"

           if ($"($env.HOME)/.nix-defexpr/channels" | path exists) { $env.NIX_PATH = $"($env.HOME)/.nix-defexpr/channels:" + $env.NIX_PATH }
    '';

    configFile.text = ''
      source ${./catppuccin_mocha.nu}

      alias ls-builtin = ls;

      def ls [
        --long (-l), # Get all available columns for each entry (slower; columns are platform-dependent)
        --short-names (-s), # Only print the file names, and not the path
        --full-paths (-f), # display paths as absolute paths
        --du (-d), # Display the apparent directory size ("disk usage") in place of the directory metadata size
        --directory (-D), # List the specified directory itself instead of its contents
        --mime-type (-m), # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
        --threads (-t), # Use multiple threads to list contents. Output will be non-deterministic.
        ...pattern: glob, # The glob pattern to use.
      ]: [nothing -> table] {
        let pattern = if ($pattern | is-empty) { ['.'] } else { $pattern }

        (
          ls-builtin
          -a
          --long=$long
          --short-names=$short_names
          --full-paths=$full_paths
          --du=$du
          --directory=$directory
          --mime-type=$mime_type
          --threads=$threads
          ...$pattern
        ) | sort-by type name -i
      }
    '';

    settings = {
      show_banner = false;

      history = {
        file_format = "sqlite";
        sync_on_enter = true;
      };

      buffer_editor = "nvim";

      edit_mode = "vi";

      highlight_resolved_externals = true;

      completions.external = {
        enable = true;
      };
    };
  };

  programs.carapace = {
    enable = true;

    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
