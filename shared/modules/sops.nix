{pkgs, ...}: {
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile =
    if pkgs.stdenv.isLinux
    then "/home/bronstedk/.config/sops/age/keys.txt"
    else "/Users/bronstedk/.config/sops/age/keys.txt";

  # access with config.sops.secrets."${name}"
  sops.secrets = {
    "../secrets/jj_config.toml.enc" = {
	owner = "bronstedk";
	path = let
	  prefix = if pkgs.stdenv.isLinux 
	    then "/home/bronstedk"
	    else "/Users/bronstedk";
	in "${prefix}/.config/jj/config.toml";
    };
  };
}
