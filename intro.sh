#!/usr/bin/bash

# Import necessary modules for colors and animations
source /data/data/com.termux/files/usr/etc/bash_colors.sh
source /data/data/com.termux/files/usr/etc/bash_animations.sh

# Function to generate a dynamic and colorful welcome banner
generate_welcome_banner() {
    local name=$1

    # Clear the screen
    clear

    # Display a colorful ASCII banner with dynamic colors and animations
    echo -e "${BOLD}${CYAN}"
    echo "********************************************"
    echo "  WELCOME TO TERMUX, $name! 🌟"
    echo "********************************************"
    echo -e "${RESET}"

    # Animate the user's name with a cool color-changing effect
    animate_text "$name" "figlet" "$BOLD$MAGENTA" "$BOLD$CYAN"

    # Show system info with neofetch, but with custom colors and effects
    neofetch --ascii_distro termux --colors 4 6 2 3 5 7
}

# Prompt the user for their name
echo "Enter your name:"
read name

# Generate and display the welcome banner
generate_welcome_banner "$name"

# Install the necessary packages for the script to work (if not already installed)
apt update -y && apt upgrade -y
apt install neofetch --yes
apt install figlet --yes
apt install lolcat --yes  # For colorful output

# Remove any existing MOTD files to avoid conflicts
rm -f /data/data/com.termux/files/usr/etc/motd
rm -f /data/data/com.termux/files/usr/etc/motd.sh

# Create a new MOTD script with the enhanced welcome message
echo "#!/usr/bin/bash
generate_welcome_banner \"$name\"
" > /data/data/com.termux/files/usr/etc/profile.d/motd.sh

# Make sure the new MOTD script is executable
chmod +x /data/data/com.termux/files/usr/etc/profile.d/motd.sh

# Clear the screen and notify the user to restart Termux
clear
echo -e "${BOLD}${GREEN}V.2.0${RESET}"
echo -e "${BOLD}${YELLOW}Your new Termux experience is ready! Please restart Termux to see the changes. Enjoy!${RESET}"
