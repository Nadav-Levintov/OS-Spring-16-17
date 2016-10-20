#!/bin/bash

cd /usr/src/linux-2.4.18-14custom
make bzImage
sleep 25
make modules
sleep 25
mke modules_install
sleep 20
cd archi/i386/boot
cp bzImage /boot/vmlinuz-2.4.18-14custom
sleep 2
echo "y"
sleep 3
mkinitrd 2.4.18-14-custom.img 2.4.18-14custom
sleep 5
reboot