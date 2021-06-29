{ ... }: {
  networking = {
    useDHCP = false;
    networkmanager.enable = true;
    nameservers = [ "114.114.114.114" "8.8.8.8" ];
  };
}
