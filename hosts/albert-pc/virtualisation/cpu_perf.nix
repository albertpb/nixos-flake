{ pkgs, ... }:
{
  systemd.services.vm-cpu-perf = {
    description = "Pin VM cores to max frequency and disable prefcore";
    wantedBy = [ "multi-user.target" ];
    after = [ "sysinit.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      echo 0 > /sys/devices/system/cpu/amd_pstate/prefcore
      for i in 0 1 2 3 4 5 6 7 16 17 18 19 20 21 22 23; do
        echo 5756452 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq
      done
    '';
  };
}
