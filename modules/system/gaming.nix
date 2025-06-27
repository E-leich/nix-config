{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Gaming platforms
    steam
    lutris

    # Performance & overlays
    gamemode
    mangohud

    # Vulkan stuff
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-utility-libraries

    # Windows compatibility layers
    wine
    wineWowPackages.full   # 32 + 64 bit Wine
    protonup-ng            # Steam's Proton compatibility tool
    dxvk                   # Vulkan-based D3D translator
    vkd3d                  # Direct3D 12 to Vulkan translation (used by Proton/Wine)
    winetricks             # Helper for Wine DLLs/installers

    # Helpers for running Windows games
    steam-run             # run commands in Steam runtime
    lutris                # game management
    bottles

    # Optional: communication apps popular with gamers
    discord
  ];

  programs.gamemode.enable = true;
}

