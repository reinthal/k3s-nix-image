{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nixos-generators = {
      url = "github:reinthal/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixos-generators,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages = {
        proxmox = nixos-generators.nixosGenerate {
          system = "${system}";
          specialArgs = {
            diskSize = "30480";
            virtio0 = "local-zfs:vm-9999-disk-0";
            cloudInitDefaultStorage = "local-zfs";
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
      devShells.default = let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        pkgs.mkShell {
          buildInputs = [];
        };
    });
}
