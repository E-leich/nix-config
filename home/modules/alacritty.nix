{ config, pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = { x = 8; y = 8; };
        decorations = "none";
        opacity = 0.95;
      };

      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        size = 12.5;
      };

      colors = {
        primary = {
          background = "0x1e1e2e";
          foreground = "0xcdd6f4";
        };
        cursor = {
          text = "0x1e1e2e";
          cursor = "0xcdd6f4";
        };
      };

      terminal.shell.program = "${pkgs.zsh}/bin/zsh";
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    pkgs.nerd-fonts.fira-code
  ];
}

