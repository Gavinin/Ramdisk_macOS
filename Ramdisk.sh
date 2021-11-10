#!/bin/bash

#mount
if [ ! -z "$1" ] && [ -z "$(echo $1 | sed 's#[0-9]##g')" ] 
then
	if [ ! -d "/Volumes/RamDisk" ]; then
		Num1=$1
		let Num1=Num1*2048
		diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://$Num1`
	else
		echo "RAM DISK has exist"
	fi

	
#umount	
elif [ "$1" == "umount" ]
	then
		diskutil eject /Volumes/RamDisk
	if [ $? -ne 0 ]; then
		echo "No Capacty"
	fi

#Default is 1GB
elif [ -z "$1"]
	then
	if [ ! -d "/Volumes/RamDisk" ] 
	then
		let Num_Default=1024*2048
		diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://$Num_Default`
	else
		echo "RAM DISK has exist"
	fi
fi