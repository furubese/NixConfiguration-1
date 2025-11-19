{ config, pkgs, ... }:

{
  # Legacy
  # imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal-combined.nix> ];

  services.openssh = {
      enable = true;
      ports = [22];
  };

  users.users.frse = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      hashedPassword = "$6$eq8vfHcH9q.1xDev$Y2aKyNEgTxMTbxEMPy1qe7Od/gorzLVSU1fA1pCAj4c38SeQVPAdL8fwN1sk5ryuSWR.NcJA9el4JmoHP2yxS1";
  };

}
