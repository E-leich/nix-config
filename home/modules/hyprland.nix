{ config, pkgs, ... }:
let
  # Define browser and terminal for easy modification
  browser = "firefox"; # Changed to a common browser for a more minimal default
  terminal = "alacritty"; # Changed to a common terminal for a more minimal default
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true; # Essential for running X applications

    settings = {
      env = [ "AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card2" ];
      # Basic autostart applications
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar &" # Basic status bar
        "swaync &" # Notification daemon
        "hyprctl setcursor Bibata-Modern-Ice 24 &" # Basic cursor setting
        "hyprlock" # Lock screen
        "${terminal}" # Start terminal
        "[workspace 1 silent] ${browser}" # Start browser on workspace 1
      ];

      monitor = [
        "HDMI-A-1,2560x1440@144,0x0,1"
        "eDP-2,1920x1080@144,320x1440,1"
      ];

      # Input settings
      input = {
        kb_layout = "fi"; # Simplified keyboard layout
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1; # Follow mouse focus
        sensitivity = 0;
      };

      # General window management settings
      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(89B4FA)"; # Simple active border color
        "col.inactive_border" = "0x00000000"; # Transparent inactive border
        no_border_on_floating = false;
      };

      # Basic decoration (no blur or shadow by default for minimalism)
      decoration = {
        rounding = 5; # Slight rounding 
      };

      # Core animations
      animations = {
        enabled = true;
        bezier = "easeInOut, 0.4, 0.0, 0.2, 1.0"; # A simple bezier curve
        animation = [
          "windows, 1, 4, easeInOut"
          "fade, 1, 4, easeInOut"
          "workspaces, 1, 5, easeInOut"
        ];
      };

      # Dwindle layout specifics
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Miscellaneous settings
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
      };

      # Essential keybindings
      bind = [
        "$mainMod, Return, exec, ${terminal}"
        "$mainMod, Q, killactive,"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, F, fullscreen,"
        "$mainMod, Space, togglefloating,"
        "$mainMod, P, pseudo," # Pseudotile mode

        # Focus movement
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        # Move window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"

        # Basic screenshot
        ", Print, exec, grimblast copy screen"
      ];

      # Mouse bindings for moving and resizing windows
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Essential window rules (minimal examples)
      windowrule = [
        "float,class:^(org.gnome.Calculator)$" # Calculator floats
        "float,class:^(zenity)$" # Zenity dialogs float
        "noanim,class:^(xwaylandvideobridge)$" # No animations for XWayland bridge
      ];
    };
  };

  # Enable core programs
  programs.alacritty.enable = true; # Changed to alacritty
  programs.wofi.enable = true;
  services.dunst.enable = true;
  programs.waybar.enable = true;
}
