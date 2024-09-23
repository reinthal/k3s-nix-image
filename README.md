# Why this repo?

Nix reproducible cloud images that run k3s kubernetes.

## How setup a k3s node for Proxmox (vm)

```bash
nix build #proxmox
```


Then 

```bash
scp result/vzdump*.zst root@pve:~
```

Followed by 

```bash
qmrestore ~/vzdump*.zst <vmid>
```

see

```bash
man qmrestore
```

for options

##  How to setup a k3s node for Proxmox (lxc)


```bash
nix build #promxox-lxc
```

```
scp result/tarball/nixos-system-x86_64-linux.tar.xz root@pve:/var/lib/vx/template/cache/
```

Then create a container from the GUI using the `nixos-system-x86_64-linux.tar.xz` as a template.


