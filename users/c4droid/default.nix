{ ... }: {
  users.users.c4droid = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" ];
  };
}
