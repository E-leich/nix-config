{ config, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true; # CRUCIAL for 32-bit Wine applications
  };
}
