{ ... }: {
  imports = [
    ./bootloader.nix
    ./kernelPackages.nix
    ./fileSystems.nix
    ./hostname.nix
    ./timezone.nix
    ./language.nix
    ./networking.nix
    ../../modules/interface/console.nix
    ../../modules/interface/desktop.nix
    ../../modules/hardware/sound.nix
    ../../modules/hardware/vmware.nix
    ./nixFlakes.nix
    ./systemPackages.nix
    ../../users/c4droid
    ../../modules/service/openssh.nix
    ../../modules/virtual/virtualbox.nix
  ];
  system.stateVersion = "21.05";
}
