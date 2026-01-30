{
  lib,
  modulesPath,
  ...
}: {
  _file = ./format-module.nix;
  # This deliberate key makes sure this module will be deduplicated
  # regardless of the accessor path: either via flake's nixosModule
  # or as part of the nixos-generate command. These two store paths
  # of the module may differ and hence don't serve as a key
  key = "github:nix-community/nixos-generators/format-module.nix";

  imports = ["${modulesPath}/virtualisation/disk-size-option.nix"];

  options = {
    fileExtension = lib.mkOption {
      type = lib.types.str;
      description = "Declare the path of the wanted file in the output directory";
      default = "";
    };
    formatAttr = lib.mkOption {
      type = lib.types.str;
      description = "Declare the default attribute to build";
    };
  };

  config.warnings = [
    "nixos-generators is deprecated, since it has been upstreamed into nixpkgs as of NixOS 25.05. See https://nixos.org/manual/nixos/stable/#sec-image-nixos-rebuild-build-image or nixos-generators README on how it works."
  ];
}
