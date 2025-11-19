{
  description = "my-flakes-frse";

  # パッケージ設定
  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    k0s-nix.url = "github:johbo/k0s-nix";
  };

  outputs = { self, nixpkgsa, k0s-nix, ... }:
  let
    system = "x86_64-linux";
  in
  {
     nixosConfigurations.controller = nixpkgs.lib.nixosSystem {
       inherit system;
       modules = [
          ./configuration.nix
          k0s-nix.nixosModules.default
       ];
     };
  };
}

