{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Set some common Git config values
    userName = "eleich";
    userEmail = "eleich@proton.me";
  };

  home.packages = with pkgs; [
    git
  ];
}

