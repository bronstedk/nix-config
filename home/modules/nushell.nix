{...}: {
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

    configFile.text = ''
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
