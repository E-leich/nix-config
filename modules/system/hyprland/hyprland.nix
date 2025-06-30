{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    systemd.setPath.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    hyprland
    kitty
    wofi
    waybar
    swww
    dunst
    wl-clipboard
    cliphist
    brightnessctl
    playerctl
    pamixer
    networkmanagerapplet
    grim slurp
    hyprlock
    hypridle
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  security.polkit.enable = true;
  services.dbus.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "Hyprland";
      user = "eleich"; 
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "hyprland";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}

