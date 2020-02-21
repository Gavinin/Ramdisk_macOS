#!/bin/bash

#mount
if [ -z "$(echo $1 | sed 's#[0-9]##g')" ]
then
	if [ ! -d "/Volumes/RamDisk" ]; then
		Num1=$1
		setopt nonomatch
		let Num1=Num1*2048
		diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://$Num1`
	else
		echo "RAM DISK has exist"
	fi
	
#umount	
elif [ "$1" == "umount" ] 
then
	diskutil eject /Volumes/RamDisk
else	
	echo "No Capacty"
fi

