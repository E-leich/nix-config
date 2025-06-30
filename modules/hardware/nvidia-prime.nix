{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [
    "modesetting"  # for your AMD iGPU under Wayland, use "modesetting" driver here
    "nvidia"
    "amdgpu"
  ];
  
  # Use Open source drivers (Recommended for nixos)
  hardware.nvidia.open = true;

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;  # enables the `prime-run` command
    };

    # Your PCI Bus IDs from lspci:
    amdgpuBusId = "PCI:5:0:0";   # your AMD GPU
    nvidiaBusId = "PCI:1:0:0";   # your NVIDIA GPU
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    mesa
  ];
}

