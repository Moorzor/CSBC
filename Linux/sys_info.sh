#!/bin/bash

# Check if script was run as root. Exit if false
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
exit
fi

# Define Variables
output=$HOME/research/sys_info.txt
files=(
     '/etc/passwd'
     '/etc/shadow'
)

# Check for a research directory, Create it if needed.
if [ ! -d $HOME/research ]
then
  mkdir $HOME/research
fi

# Print permissions of each file in /etc
for file in ${files[@]};
do
  ls -l $file >> $output
done




# Check for output file. CLear it if exists.
if [ -f $output ]
then
  rm $output
fi


echo ""
echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | grep inet | tail -3 | head -1 | awk '{print $2}') \n" >> $output
echo "Hostname: $(hostname -s)" >> $output
echo "DNS Servers:" >> $output
cat /etc/resolv.conf >> $output
echo "Memory Info:" >> $output
free >> $output
echo -e "\nDisk Usage:" >> $output
lscpu | grep CPU >> $output

