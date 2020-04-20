#!/bin/bash

# disk check 

if [ -b /dev/sdb1 ]
then
	echo "/dev/sdb1 exists"
else
	echo "/dev/sdb1 doesn't exist - you fail!"
fi

if [ -b /dev/sdb2 ]
then
	echo "/dev/sdb2 exists"
else
	echo "/dev/sdb2 doesn't exist - you fail!"
fi


# /excercise and LVM check

if [ -L /dev/mapper/exercisevg-exercise.fs ]
then
	echo "/dev/mapper/exercisevg-exercise.fs exists"
else
	echo "/dev/mapper/exercisevg-exercise.fs - you fail!"
fi

if grep -q -i /exercise /etc/mtab
then
	echo "/exercise is mounted"
else
	echo "/exercise is not mounted - you fail!"
fi

if ls -l / | grep exercise | grep Andrews_Group
then
	echo "/exercise permissions are good...possibly"
else
	echo "/exercise permissions are not good - You fail!"
fi

# User check

if id Andrew | grep -q -i  Andrews_Group
then
	echo "User Andrew has Andrews_Group included"
else
	echo "User Andrew does not have Andrews_Group included - You fail!"
fi

if id Milton | grep -q -i  Andrews_Group
then
	echo "User Milton has Andrews_Group included"
else
	echo "User Milton does not have Andrews_Group included - You fail!"
fi

if id Andrew | grep -q -i  1009
then
	echo "User Andrew has the UID set to 1009"
else
	echo "User Andrew does not have the UID set to 1009 - You fail!"
fi

if id Andrew | grep -q -i  1020
then
	echo "User Andrew has the GID set to 1020"
else
	echo "User Andrew does not have the GID set to 1020 - You fail!"
fi



# RPM Check

if [ -f /tmp/plexmediaserver*.rpm ]
then
	echo "/tmp/plexmediaserver*.rpm exists"
else
	echo "/tmp/plexmediaserver*.rpm does not exist - you fail!"
fi

if rpm -qa | grep plex
then
	echo "Plex is installed"
else
	echo "Plex is not installed - You fail!"
fi

# NFS-server check

if exportfs -s | grep /exercise
then
	echo "/exercise is exported"
else
	echo "/exercise is not exported - You fail!"
fi

if [ -f /exercise/test.txt ]
then
	echo "/exercise/test.txt exists"
else
	echo "/exercise/test.txt does not exist - you fail!"
fi

if systemctl status nfs-server | grep  'disabled;'
then
	echo "nfs-server is enabled"
else
	echo "nfs-server is still disabled - You fail!"
fi

# hostname

if hostname | grep exercise_server
then
	echo "hostname is set to exercise_server"
else
	echo "hostname is not set to exercise_server - You fail!"
fi


