{
  description = "my-flakes-frse";

  # パッケージ設定
  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  {
    # default
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
    # Master
    nixosConfigurations.controller = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
         ./configuration.nix
         ./master.nix
      ];
    };
    # Slave
    nixosConfigurations.agent = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
         ./configuration.nix
         ./slave.nix
      ];
    };
  };
}

