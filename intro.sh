#!/usr/bin/bash
echo "Enter name"
read name
#copies the following code to motd.sh
echo "echo "★★★★★★★★★★★★★★★★★★★★★★★★★★★★"
echo "Welcome to Termux $name! 😈"
echo "★★★★★★★★★★★★★★★★★★★★★★★★★★★★"
figlet $name
neofetch" > motd.sh
#tries to remove motd file if any
rm /data/data/com.termux/files/usr/etc/motd
#trie to remove motd.sh file if any
rm /data/data/com.termux/files/usr/etc/motd.sh
#moves the created motd.sh file to profile.d directory
mv motd.sh /data/data/com.termux/files/usr/etc/profile.d 
clear
echo "Please restart Termux now to confirm changes. Enjoy!"
