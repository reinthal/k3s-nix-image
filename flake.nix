{
  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixos-generators,
    sops-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.x86_64-linux = {
      proxmox = nixos-generators.nixosGenerate {
        system = "${system}";
        specialArgs = {
          diskSize = "20480";
        };
        modules = [
          ({...}: {nix.registry.nixpkgs.flake = nixpkgs;})
          ./server
        ];
        format = "proxmox";
      };

      proxmox-lxc = nixos-generators.nixosGenerate {
        system = "${system}";
        modules = [
          ({...}: {nix.registry.nixpkgs.flake = nixpkgs;})
          ./server
        ];
        format = "proxmox-lxc";
      };
    };
  };
}
