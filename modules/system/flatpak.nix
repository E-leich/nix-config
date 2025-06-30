{ config, ... }: {
  services.flatpak.enable = true;
  services.flatpak.packages = [
    # Bottles Flatpak ID from Flathub
    { appId = "com.usebottles.bottles"; origin = "flathub"; }
    { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
  ];
  services.flatpak.uninstallUnmanaged = true;
}
