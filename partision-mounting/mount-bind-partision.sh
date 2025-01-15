#!/bin/bash

# Function to check for root privileges
check_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "This operation requires root privileges. You need to run the script with sudo or as root."
    exit 1
  fi
}

# Check for root privileges
check_root

# Ask for the partition to mount if not provided as an argument
if [ -z "$1" ]; then
  read -p "Enter the partition to mount (e.g., /dev/nvme0n1p6): " partition
else
  partition=$1
fi

# Mount the partition and bind required directories
mount $partition /mnt || { echo "Failed to mount $partition"; exit 1; }
mount --bind /dev /mnt/dev || { echo "Failed to bind /dev"; exit 1; }
mount --bind /run /mnt/run || { echo "Failed to bind /run"; exit 1; }
mount --bind /sys /mnt/sys || { echo "Failed to bind /sys"; exit 1; }
mount --bind /proc /mnt/proc || { echo "Failed to bind /proc"; exit 1; }

echo "Mounting complete."

