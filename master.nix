{ config, lib, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = "--write-kubeconfig-mode 644";
  };
  networking.firewall.allowedTCPPorts = [ 6443 ];
}
