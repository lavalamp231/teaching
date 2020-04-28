#!/bin/bash

# checking if /dev/sdb1 exists if it does exists then
# create partition /dev/sdb1

if [ -b /dev/sdb1 ]; then
	echo "/dev/sdb1 exists"
else
	echo -e "n\np\n1\n\n3G\nw" | fdisk /dev/sdb
	pvcreate /dev/sdb1
fi

# checking if /dev/sdb2 exists if it does exists then
# create partition /dev/sdb2

if [ -b /dev/sdb2 ]; then
	echo "/dev/sdb2 exists"
else
	echo -e "n\np\n2\n\n6G\nw" | fdisk /dev/sdb
	pvcreate /dev/sdb1
fi

if vgs | grep exercisevg; then
	echo "exercisevg exists"
else
	vgcreate Excercise_2_VG /dev/sdb1 /dev/sdb2
fi

if lvs | grep Exercise_2.fs; then
	echo "Exercise_2.fs exists"
else
	lvcreate -L 2G -n Exercise_2.fs Excercise_2_VG
fi 

if lvs | grep Exercise_2_2.fs; then
	echo "Exercise_2_2.fs exists"
else
	lvcreate -L 6G -n Exercise_2_2.fs Excercise_2_VG
fi 

# Create NFS server

if rpm -qa | grep nfs-utils; then
	echo "nfs-utils is installed"
else
	yum install nfs-utils -y
fi

if systemctl status nfs-server | grep "active (exited)"
	echo "systemctl nfs-server is started"
else
	systemctl start nfs-server
fi

if [ -L /etc/systemd/system/multi-user.target.wants/nfs-server.service ]; then
	echo "nfs-server is enabled"
else
	systemctl enable nfs-server
fi

if [ -d /my_export ]; then
	echo "/my_export exists"
else
	mkdir /my_export
fi

client = "192.168.0.11"

if grep "/my_export $client(rw,sync)" /etc/exports; then
	echo "my_export exists"
else
	echo "/my_export $client(rw,sync)" >> /etc/exports
fi

if exportfs -s | grep /my_export; then
	echo "export my_export exists"
else
	exportfs -ar
fi

# hostname check

if hostname | grep file_server01; then
	echo "hostname is file_server01"
else
	hostnamectl set-hostname file_server01
fi

#Users and Groups

#Group 



# Check if the user exists - done
# Check if the user has UID 1089 
# Check if the UID 1089 already exists
# Check if the the user Andrew is part of the group Andrews Group
# Check if user exists and if user DOES exists and has a different UID

if grep "Andrew" /etc/passwd; then
	if grep /etc/passwd | grep Andrew | grep 1089; then
		echo "Andrew exists with 1089"
	elif ! grep 1089 /etc/passwd | grep Andrew; then
		usermod -u 1089 Andrew
	elif ! cat /etc/group | grep Andrews_Group; then
		usermod -g Andrews_Group -a Andrew
	fi
else
	useradd Andrew -u 1089 -Ga Andrews_Group
fi