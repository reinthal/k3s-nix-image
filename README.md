# Why this repo?

Because you want a nix proxmox image that can be easily reproduced.

# How to build the image

```bash
nix run github:nix-community/nixos-generators -- --format proxmox -I nixpkgs=channel:nixos-23.05 -c ./configuration.nix
```
