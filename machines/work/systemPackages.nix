{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    git
    alacritty
    ranger
    tmux
    w3m
    clash
  ];
}
