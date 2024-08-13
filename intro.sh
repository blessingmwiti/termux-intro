#!/usr/bin/bash

# Update and install necessary packages
apt update -y && apt upgrade -y
apt install neofetch --yes
apt install figlet --yes
apt install ruby --yes
apt install ncurses-utils --yes
gem install lolcat

clear

# Prompt the user for their name
echo "Enter your name:"
read name

# Remove any existing MOTD files to avoid conflicts
rm -f /data/data/com.termux/files/usr/etc/motd
rm -f /data/data/com.termux/files/usr/etc/motd.sh

# Create a new MOTD script with the enhanced welcome message
cat <<EOF > /data/data/com.termux/files/usr/etc/profile.d/motd.sh
#!/usr/bin/bash
GREEN="\\e[92m"
ORANGE="\\e[33m"
BLUE="\\e[94m"
STOP="\\e[0m"
printf "\${GREEN}"
printf "********************************************\\n"
printf "\${ORANGE}"
printf "  WELCOME TO TERMUX, $name! 🌟\\n"
printf "\${GREEN}"
printf "********************************************\\n"
printf "\${BLUE}"
figlet $name
printf "\${STOP}"
neofetch --ascii_distro termux --colors 4 6 2 3 5 7
EOF

# Make sure the new MOTD script is executable
chmod +x /data/data/com.termux/files/usr/etc/profile.d/motd.sh

# Clear the screen and notify the user to restart Termux
clear
echo -e "\033[1;32mV.2.0\033[0m"
echo -e "\033[1;33mYour new Termux experience is ready! Please restart Termux to see the changes. Enjoy!\033[0m"
