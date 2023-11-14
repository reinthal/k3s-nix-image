# How to build the image

```bash
nix run github:nix-community/nixos-generators -- --format proxmox -I nixpkgs=channel:nixos-23.05 -c ./configuration.nix
```
