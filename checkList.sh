#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo Permission Denied: Bro you must run this as root :D
	exit
fi

printf "\nDisplay list of avaible theme:\n\n"
update-alternatives --config default.plymouth

