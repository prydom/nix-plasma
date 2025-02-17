let
  nixos = import <nixpkgs/nixos> {
    configuration = ./configuration.nix;
    system = "x86_64-linux";
  };
  pkgs = nixos.pkgs;
  cfg = nixos.config.hardware.graphics;
in
  pkgs.buildEnv {
      name = "graphics-drivers";
      paths = [ cfg.package ] ++ cfg.extraPackages;
  }