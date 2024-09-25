#!/data/data/com.termux/files/usr/bin/bash
clear

# Color codes
Color_Off='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Cyan='\033[0;36m'
Yellow='\033[0;33m'

# Config file path for fish shell
config="$PREFIX/etc/fish/config.fish"

# Function to install necessary dependencies (fastfetch instead of neofetch)
prerequisite() {
    echo -e "${Green}Installing Dependencies...${Cyan}"
    
    # Check if fish, figlet, and fastfetch are installed
    if [[ -f $PREFIX/bin/fish && -f $PREFIX/bin/figlet && -f $PREFIX/bin/fastfetch ]]; then
        echo -e "${Green}Dependencies are already installed!"
    else
        pkg update -y
        pkg install -y fish figlet fastfetch  # Install fastfetch
        
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

# Write custom fish functions to the config file
{
    echo -e "function __fish_command_not_found_handler --on-event fish_command_not_found
    /data/data/com.termux/files/usr/libexec/termux/command-not-found \$argv[1]
end"
    echo -e "function cls
    clear
end"
} > "$config"

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

# Replace any existing fastfetch line at the end of config.fish
sed -i '/fastfetch/d' "$config"

# Ask user for logo configuration
echo -e "${Green}[*]Would you like to use random logos or a custom logo? (r/c): ${Cyan}"
read -p "Enter 'r' for random logos or 'c' for custom: " logo_choice

if [[ "$logo_choice" == "r" ]]; then
    # Add random logo selection to config
    {
        echo -e "# Randomly select a logo for fastfetch"
        echo -e "set -l logos 'android arch kali ubuntu gentoo tux debian fedora raspberry pi opensuse slackware void linuxmint gentoo redhat suse manjaro alpine popos mint archlabs solus lxle knoppix nixos clear'"
        echo -e "set -l random_logo (echo \$logos | tr ' ' '\n' | shuf -n 1)"
        echo -e "fastfetch --logo \$random_logo"
    } >> "$config"
    echo -e "${Cyan}*Configured fastfetch to use random logos*"
elif [[ "$logo_choice" == "c" ]]; then
    echo -e "${Green}[*]Select a custom logo from the following options:"
    echo "1) Android"
    echo "2) Arch Linux"
    echo "3) Kali"
    echo "4) Ubuntu"
    echo "5) Gentoo"
    echo "6) Penguin (Tux)"
    echo "7) Debian"
    echo "8) Fedora"
    echo "9) Raspberry Pi"
    echo "10) OpenSUSE"
    echo "11) Slackware"
    echo "12) Void"
    echo "13) Linux Mint"
    echo "14) Red Hat"
    echo "15) SUSE"
    echo "16) Manjaro"
    echo "17) Alpine"
    echo "18) Pop!_OS"
    echo "19) Mint"
    echo "20) Archlabs"
    echo "21) Solus"
    echo "22) LXLE"
    echo "23) Knoppix"
    echo "24) NixOS"
    echo "25) Clear Linux"
    read -p "Enter the number corresponding to your choice: " custom_choice
    
    case $custom_choice in
        1 ) echo "fastfetch --logo android" >> "$config" ;;  
        2 ) echo "fastfetch --logo arch" >> "$config" ;;     
        3 ) echo "fastfetch --logo kali" >> "$config" ;;     
        4 ) echo "fastfetch --logo ubuntu" >> "$config" ;;   
        5 ) echo "fastfetch --logo gentoo" >> "$config" ;;    
        6 ) echo "fastfetch --logo tux" >> "$config" ;;       
        7 ) echo "fastfetch --logo debian" >> "$config" ;;    
        8 ) echo "fastfetch --logo fedora" >> "$config" ;;    
        9 ) echo "fastfetch --logo raspberry" >> "$config" ;; 
        10 ) echo "fastfetch --logo opensuse" >> "$config" ;; 
        11 ) echo "fastfetch --logo slackware" >> "$config" ;; 
        12 ) echo "fastfetch --logo void" >> "$config" ;;     
        13 ) echo "fastfetch --logo linuxmint" >> "$config" ;; 
        14 ) echo "fastfetch --logo redhat" >> "$config" ;;   
        15 ) echo "fastfetch --logo suse" >> "$config" ;;     
        16 ) echo "fastfetch --logo manjaro" >> "$config" ;;   
        17 ) echo "fastfetch --logo alpine" >> "$config" ;;    
        18 ) echo "fastfetch --logo popos" >> "$config" ;;     
        19 ) echo "fastfetch --logo mint" >> "$config" ;;      
        20 ) echo "fastfetch --logo archlabs" >> "$config" ;;  
        21 ) echo "fastfetch --logo solus" >> "$config" ;;     
        22 ) echo "fastfetch --logo lxle" >> "$config" ;;      
        23 ) echo "fastfetch --logo knoppix" >> "$config" ;;   
        24 ) echo "fastfetch --logo nixos" >> "$config" ;;     
        25 ) echo "fastfetch --logo clear" >> "$config" ;;     
        * ) echo -e "${Red}Invalid selection. Using no logo." && echo "fastfetch" >> "$config" ;;
    esac
    echo -e "${Cyan}*Configured fastfetch with your custom logo choice*"
else
    echo -e "${Red}Invalid option selected. Exiting."
    exit 1
fi

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
