{ ... }: {
  programs.ssh.enable = true;
  programs.ssh.extraConfig = ''
        Host github
            Hostname github.com
    	User git
    	IdentityFile ~/.ssh/github
      '';
}
