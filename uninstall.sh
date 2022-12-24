#!/bin/bash

THEME='SuperMario'

if [ $EUID -ne 0 ]; then
	echo Permission Denied: Bro you must run this as root :D
	exit
fi

printf "Uninstalling '${THEME}' theme..."
update-alternatives --quiet --remove default.plymouth /usr/share/plymouth/themes/${THEME}/${THEME}.plymouth
printf ".. DONE\n"

printf "Removing '${THEME}' theme files..."
rm -rf /usr/share/plymouth/themes/${THEME}
printf " DONE\n"

printf "Selecting default theme..."
update-alternatives --quiet --auto default.plymouth
printf "......... DONE\n"

printf "Updating initramfs...\n"
printf "Usually take 15-20 s \n"
update-initramfs -u
printf "DONE\n"
