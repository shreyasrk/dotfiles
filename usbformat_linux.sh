#!/bin/bash

# Long story short. Just read through and execute the instructions one-by-one.
# Do NOT attempt to be too heroic. You might end up loosing your data on the hard-drive.

# Plugin USB to any USB drive and run
dmesg | tail

# Your plugged-in device will be visible (sd* series: Taking sdd as example). 
# Now Unmount that device ONLY!
sudo umount /dev/sdd

# Format via FAT32 (the usual method for Windows to detect the device as well)
sudo mkdosfs -n 'Label' -I /dev/sdd

# You can also format the disk via ext3 format.
# Refer `man mkfs` for a host of options.
sudo mkfs.ext3 -n 'Label' -I /dev/sdd

# That's it. You're done. No need of changing device info in /etc/fstab either!
