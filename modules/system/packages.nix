{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
    pciutils
    wget
    alacritty
    flatpak
    lutris
    wine
    tree
  ];

  programs.firefox.enable = true;
}
