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
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.x86_64-linux = {
      proxmox = nixos-generators.nixosGenerate {
        system = "${system}";
        specialArgs = {
          diskSize = "20480";
        };
        modules = [
          ({...}: {nix.registry.nixpkgs.flake = pkgs;})
          ./server
        ];
        format = "proxmox";
      };

      proxmox-lxc = nixos-generators.nixosGenerate {
        system = "${system}";
        modules = [
          ({...}: {nix.registry.nixpkgs.flake = pkgs;})
          ./server
        ];
        format = "proxmox-lxc";
      };
    };
  };
}
