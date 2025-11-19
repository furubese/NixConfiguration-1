{
  description = "my-flakes-frse";

  # パッケージ設定
  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    k0s-nix.url = "github:johbo/k0s-nix";
  };

  outputs = { self, nixpkgs, k0s-nix, ... }@inputs:
  {
     nixosConfigurations.controller = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
          ./configuration.nix
          k0s-nix.nixosModules.default
       ];
     };
  };
}

