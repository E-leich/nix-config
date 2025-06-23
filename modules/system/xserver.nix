{ config, ... }: {
  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
  services.xserver.deviceSection = ''
    Option "PrimaryGPU" "yes"
  '';
}
