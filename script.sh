#!/data/data/com.termux/files/usr/bin/bash
clear

# Color codes
Color_Off='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Cyan='\033[0;36m'

# Config file path for fish shell
config="$PREFIX/etc/fish/config.fish"

# Clear terminal screen
clear

# Function to install necessary dependencies (fastfetch instead of neofetch)
prerequisite() {
    echo -e "${Green}Installing Dependencies...${Cyan}"
    
    # Check if fish, figlet, and fastfetch are installed
    if [[ -f $PREFIX/bin/fish && -f $PREFIX/bin/figlet && -f $PREFIX/bin/fastfetch ]]; then
        echo -e "${Green}Dependencies are already installed!"
    else
        pkg update -y
        pkg install -y fish figlet fastfetch  # Install fastfetch instead of neofetch
        
        # Verify if the installations were successful
        if type -p fish figlet fastfetch &> /dev/null; then
            echo -e "${Green}Dependencies successfully installed!"
        else
            echo -e "${Red}Error occurred, failed to install dependencies."
            echo -e $Color_Off
            exit 1
        fi
    fi
}

# Call the prerequisite function to install dependencies
prerequisite

# Disable the default fish greeting
set -U fish_greeting

# Clear terminal screen
clear

# Write custom fish functions to the config file (ensure it adds at the end)
echo -e "function __fish_command_not_found_handler --on-event fish_command_not_found
    /data/data/com.termux/files/usr/libexec/termux/command-not-found \$argv[1]
end
function cls
    clear
end
" > "$config"

# Display banner with figlet
echo -e $Red
figlet -f smslant "Termux Fish"
echo -e $Color_Off
printf '\n'

# Remove the termux greeting (motd)
echo -e "${Green}[*]Clearing greeting text of termux..."
sleep 2s
[[ -f "$PREFIX/etc/motd" ]] && rm "$PREFIX/etc/motd"
printf '\n'
echo -e "${Cyan}*Cleared greeting text of termux*"
printf '\n'

# Replace any existing fastfetch/neofetch line at the end of config.fish
# This removes any previous occurrence and appends the new fastfetch line
sed -i '/fastfetch/d' "$config"

# Add fastfetch with Arch Linux logo to fish config based on user input
echo -e "${Green}[*]Adding fastfetch with Arch Linux logo to homepage... ${Red}"
printf '\n'
sleep 2s
while true; do
    read -p "Do you want the Arch Linux logo in fastfetch? (y/n): " yn
    case $yn in
        [Yy]* ) echo "fastfetch --logo arch" >> "$config"; break;;  # Using Fastfetch with Arch Linux logo
        [Nn]* ) echo "fastfetch" >> "$config"; break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done
printf '\n'
sleep 2s
echo -e "${Cyan}*Added fastfetch with Arch Linux logo to homepage*"
printf '\n'

# Set fish as the default shell
echo -e "${Green}[*]Setting fish as the default shell... ${Cyan}"
printf '\n'
sleep 2s
chsh -s fish
echo -e "*Set fish as the default shell*"
sleep 2s
printf '\n'

# Completion message
echo -e "${Green}Done!\n\nNow restart Termux for the changes to take effect.\n\n"
