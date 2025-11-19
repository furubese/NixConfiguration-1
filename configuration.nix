{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "master-cp";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh = {
      enable = true;
      ports = [22];
  };

  users.users.frse = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = "$6$eq8vfHcH9q.1xDev$Y2aKyNEgTxMTbxEMPy1qe7Od/gorzLVSU1fA1pCAj4c38SeQVPAdL8fwN1sk5ryuSWR.NcJA9el4JmoHP2yxS1";
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  vim
  wget
  git
  ];

  services.k0s = {
    enable = true;
    role = "controller";
    tokeFile = "/etc/k0s/k0stoken";
  };

  system.stateVersion = "25.05";

}
