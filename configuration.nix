# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
services.sshd.enable = true;
system.stateVersion = "23.05";
users.users.kog = {
  isNormalUser = true;
  openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDakbytHYHeMYF4d37T3uOa5ILBFZ+LV25ViUMKiI5slozK56aRsZJrEPbQuLCt48uNkmY4yR1QztY3JCCysPRp4Co8Pi7YuYmd6DmU1k2f27JVno/K8DaGH7miPBLjcmoQguZFV460yirs7Rd4swQa9OMfBCtQ2w/rBga71yG9h6qNvF5csbBx8En8LIADvTsu+F61qQfQxhR37iUwozKmsbfMTiDu+p+n3T38RG8vuqBz3PSEXLQxLVel4ZdFcUvFz+yJc5qyRumTZO68QuWEI/D+FGSld8OHzlvUdELhhoK/986VmMhxR69Mv+ILa/7r0B3EkYO+xQqtHouf9s7GUyg2eSIjisbpVzZIEHcMx95bilJQkkIFHuFPX9gx595XZy0G3e7Wtc+HqDk/tJOFNXWKcO/BAgSCcqF6tZBsA7aJLH46pBhqxfxfykS9iMm3kTeFRZNmKEMQ9JRJnaaeyTxeEpX2sYwU4bqTaJojOJcHSKGGlfHefpkfzBnQNFk= kog@battlestation"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpbCzlfMjlenM4qgaT4WWrVhtabWCBLN7X+JaXgInu40aiDEtKVyy6cTyyZmPv1BvHi1Xyg9coJxvlTv66EJZkzrf+UUvHTZhgcog6ZqAqOblxbk7wg2w+im/2TypVj5dvU8YRFz7dLcjA8tP0kyzXaPWEsA1KbVPV1jM+7ut41NldG7es+qxN0F9gvwmnHqS3ej2ajfGlXboGvWA4mcEF03YB9ZZKn7L2QTNRoajx1b83s+UYbRSSTi2xbSXNVmBGAKmO+TH0T+/1s4dR0inUzPX2UzpCXbwMCFwy0eNeO/MVQLoPdyVVc8YjTB8+nImnFRiaP6nTR0F3e+mQ3Xq1XBKyUpHe6tbxPL4coQOkciEcK8lq89pzbzc14ZVbIpnC35XZ2K3Bxk5U/8SjXpaxJ1SPBWOR7gn9XpeLZxOqwefR+K0OsQfTst8D7WRP8MxLYlBVzXnkKlewAYuwf6neQk0+ZqEmD4EdXwjY9Az+sDR676xgWQrfFcvRVRGIUWs= kog@Alexs-MacBook-Pro.local"
  ];
  initialHashedPassword = "$y$j9T$7LKXOXtgdTDofX7./bMbm/$q/MV5ZzLrQEAVXJn08rnyqQ1UhMU8fnDu2dYzPFvnZ2";
  extraGroups = [ "wheel" ];
  packages = with pkgs; [
    zsh
    tree
    lf
    docker
    wget
    curl
    vim
    fzf
    htop
    nmap
    cifs-utils
    inetutils
  ];
};
}
