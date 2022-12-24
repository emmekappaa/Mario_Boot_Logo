#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo Permission Denied: Bro you must run this as root :D
	exit
fi

THEME='SuperMario'
INSTALLDIR=/usr/share/plymouth/themes

printf "Copying '${THEME}' theme files..."
cp -rf ./SuperMario /usr/share/plymouth/themes
printf " DONE\n"

printf "Installing '${THEME}' theme..."
update-alternatives --quiet --install ${INSTALLDIR}/default.plymouth default.plymouth ${INSTALLDIR}/${THEME}/${THEME}.plymouth 104
printf "... DONE\n"

printf "Selecting '${THEME}' theme..."
update-alternatives --quiet --set default.plymouth ${INSTALLDIR}/${THEME}/${THEME}.plymouth
printf ".... DONE\n"

printf "Updating initramfs...\n"
printf "Usually take 15-20 s \n"
update-initramfs -u
printf "DONE\n"
