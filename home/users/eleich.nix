{ config, pkgs, ... }: 

{
  imports = [
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/alacritty.nix
    ../modules/zsh.nix
    ../modules/hyprland.nix
  ];

  home.username = "eleich";
  home.homeDirectory = "/home/eleich";
  home.stateVersion = "25.05";

  programs.git.enable = true;
  home.packages = with pkgs; [ neofetch htop ];
}
