{ pkgs, config, lib, ... }:
let

  nvidiaDriverPkg = import <nixpkgs/pkgs/os-specific/linux/nvidia-x11/generic.nix> {
    version = "550.120";
    sha256_64bit = "sha256-gBkoJ0dTzM52JwmOoHjMNwcN2uBN46oIRZHAX8cDVpc=";
    sha256_aarch64 = "sha256-dzTEUuSIWKEuAMhsL9QkR7CCHpm6m9ZwtGSpSKqwJdc=";
    openSha256 = "sha256-O3OrGGDR+xrpfyPVQ04aM3eGI6aWuZfRzmaPjMfnGIg=";
    settingsSha256 = "sha256-fPfIPwpIijoUpNlAUt9C8EeXR5In633qnlelL+btGbU=";
    persistencedSha256 = "sha256-ztEemWt0VR+cQbxDmMnAbEVfThdvASHni4SJ0dTZ2T4=";
  };

in
{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/docker-image.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
  system.stateVersion = "25.05";

  i18n.supportedLocales = [ "en_CA.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  i18n.defaultLocale = "en_CA.UTF-8";

  nixpkgs.config.allowUnfree = true;
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.open = false;
  hardware.nvidia.gsp.enable = false;
  hardware.nvidia.package = pkgs.callPackage nvidiaDriverPkg {
    kernel = config.boot.kernelPackages.kernel;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.pipewire.enable = false;

  environment.systemPackages = with pkgs; [
    bashInteractive
    cacert
    nix
    kdePackages.ksshaskpass
    dconf.lib
    mesa-demos
    vulkan-tools
    google-chrome
  ];
}
