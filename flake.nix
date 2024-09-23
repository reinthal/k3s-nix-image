{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nixos-generators,
    ...
  }: {
    packages.x86_64-linux = {
      proxmox = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ({ ... }: { nix.registry.nixpkgs.flake = nixpkgs; })
          ./server
        ];
        format = "proxmox";
      };
    };
  };
}
