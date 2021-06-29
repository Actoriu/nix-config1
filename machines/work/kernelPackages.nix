{ ... }: {
  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
    };
  };
}
