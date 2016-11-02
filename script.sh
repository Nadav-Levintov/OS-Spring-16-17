#!/bin/bash
flag=0
while true; do 
    read -n1 -resp "Choose reboot option: (1) Fast reboot; (2) Controlled reboot; (e) Exit > " key
    if [ "$key" = '1' ]; then
		break
    elif [ "$key" = '2' ]; then
        flag=1
		break
    elif [ "$key" = 'e' ]; then
		exit
    else 
		echo ""
		continue
    fi
done
cd /usr/src/linux-2.4.18-14custom
make bzImage
if (( $flag == 1 )); then
	while true; do 
		read -n1 -rsp ">>>  Press 'c' - to Continue or 'e' - to Exit :  " key
		if [ "$key" = 'c' ]; then
			break
		elif [ "$key" = 'e' ]; then
			echo "Good luck!"
			exit
		else 
			echo ""
			continue
		fi
	done
fi
make modules

make modules_install

cd arch/i386/boot
cp bzImage /boot/vmlinuz-2.4.18-14custom
sleep 2
echo "y"
sleep 3
mkinitrd 2.4.18-14-custom.img 2.4.18-14custom
if (( $flag == 1 )); then
	while true; do 
		read -n1 -rsp ">>>  Press 'y' - to reboot or 'n' - to exit :  " key

		if [ "$key" = 'y' ]; then
			reboot
			break
		elif [ "$key" = 'n' ]; then
			echo "Good luck!"
			break
		else 
			echo ""
			continue
		fi
	done
fi

