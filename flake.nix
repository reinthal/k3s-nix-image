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
      k3s_server = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ./server
        ];
        format = "proxmox";
      };
    };
  };
}
