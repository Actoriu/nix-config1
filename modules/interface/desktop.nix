{ ... }: {
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
  };
  sound.enable = true;
}
