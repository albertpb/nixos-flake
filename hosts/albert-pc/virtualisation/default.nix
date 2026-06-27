{
  lib,
  pkgs,
  config,
  ...
}:
# https://github.com/zhaodice/qemu-anti-detection
#let
#  qemu-anti-detection = pkgs.qemu.overrideAttrs (old: {
#    patches = (old.patches or []) ++ [
#      (pkgs.fetchpatch {
#        url = "https://raw.githubusercontent.com/zhaodice/qemu-anti-detection/refs/heads/main/qemu-10.2.2.patch";
#        hash = "sha256-DQXxoM7ZHO8/4zIDt9gclV1kaU8wCFVE3F4VSAnaEQ4=";
#      })
#    ];
#  });
#in
{
  specialisation = {
    vm.configuration = {
      imports = [
        ./vfio.nix
        ./virtualisation.nix
        # ./libvirt.nix
      ];

      virtualisation = {
        vfio = {
          enable = true;
          IOMMUType = "amd";
          devices = [
            "10de:2684" # GPU
            "10de:22ba" # Audio
            "10de:2b85" # GPU
            "10de:22e8" # Audio
            "1987:5018" # Phison NVMe 1
            "1dbe:5236" # INNOGRIT NVMe
            "1022:15b7" # USB 3.1
          ];
          disableEFIfb = false;
          blacklistNvidia = true;
          ignoreMSRs = true;
          applyACSpatch = false;
        };

        hugepages = {
          enable = true;
          defaultPageSize = "1G";
          pageSize = "1G";
          numPages = 80;
        };
      };

      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          # package = qemu-anti-detection;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };

      programs.virt-manager.enable = true;

    };
  };

}
