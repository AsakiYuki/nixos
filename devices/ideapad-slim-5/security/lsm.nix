{...}: {
  security.lsm = ["landlock" "lockdown" "yama" "integrity" "selinux" "bpf"];
}
