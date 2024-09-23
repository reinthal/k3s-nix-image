{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixos-generators,
    ...
  }: let
    system = "x86_64-linux";
  in {
    packages.x86_64-linux = {
      proxmox = nixos-generators.nixosGenerate {
        system = "${system}";
        specialArgs = {
          pkgs = nixpkgs;
          diskSize = 20 * 1024;
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
