{ config, lib, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "agent";
    server = "https://192.168.10.123:6443";
    token = "<><>";
  };
} 
