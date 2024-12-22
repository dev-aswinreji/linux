  mount /dev/nvme0n1p4 /mnt &&
  mount --bind /dev /mnt/dev &&
  mount --bind /run /mnt/run &&
  mount --bind /sys /mnt/sys &&
  mount --bind /proc /mnt/proc



