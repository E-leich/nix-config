{ inputs, pkgs, config, lib, modulesPath, hostname, username, ... }:

{
  imports = [
    ../../modules/hardware/bootloader.nix
    ../../modules/hardware/nvidia-prime.nix
    ../../modules/hardware/opengl.nix
    ../../modules/system/locale.nix
    ../../modules/system/console.nix
    ../../modules/system/networking.nix
    ../../modules/system/pipewire.nix
    #../../modules/system/xserver.nix
    ../../modules/system/desktop.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/packages.nix
    ../../modules/system/gaming.nix
    ../../modules/system/hyprland/hyprland.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = "eleich";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      pkgs.kdePackages.kate
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
