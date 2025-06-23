{ config, pkgs, ... }: 

{
  imports = [
    ../modules/git.nix
  ];

  home.username = "eleich";
  home.homeDirectory = "/home/eleich";
  home.stateVersion = "25.05";

  programs.git.enable = true;
  home.packages = with pkgs; [ neofetch htop ];
}
