#!/data/data/com.termux/files/usr/bin/bash
clear

# Color codes
Color_Off='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Cyan='\033[0;36m'

# Config file path for fish shell
config="$PREFIX/etc/fish/config.fish"

# Function to install necessary dependencies
install_dependencies() {
    echo -e "${Green}Installing Dependencies...${Color_Off}"
    
    # Check if dependencies are already installed
    if command -v fish &>/dev/null && command -v figlet &>/dev/null && command -v fastfetch &>/dev/null; then
        echo -e "${Green}Dependencies are already installed!${Color_Off}"
        return 0
    fi
    
    # Install dependencies
    pkg update -y && pkg install -y fish figlet fastfetch
    
    # Verify installation
    if command -v fish &>/dev/null && command -v figlet &>/dev/null && command -v fastfetch &>/dev/null; then
        echo -e "${Green}Dependencies successfully installed!${Color_Off}"
    else
        echo -e "${Red}Error: Failed to install dependencies.${Color_Off}"
        exit 1
    fi
}

# Install dependencies
install_dependencies

# Display banner
echo -e "${Red}"
figlet -f smslant "Termux Fish"
echo -e "${Color_Off}\n"

# Remove termux greeting
echo -e "${Green}[*] Removing Termux greeting...${Color_Off}"
[[ -f "$PREFIX/etc/motd" ]] && rm "$PREFIX/etc/motd"
echo -e "${Cyan}* Termux greeting removed *${Color_Off}\n"

# Configure fish shell
echo -e "${Green}[*] Configuring Fish shell...${Color_Off}"

# Write fish configuration (including disabling fish greeting)
cat > "$config" << 'EOF'
# Disable fish greeting
set -U fish_greeting ""

# Custom fish functions
function __fish_command_not_found_handler --on-event fish_command_not_found
    /data/data/com.termux/files/usr/libexec/termux/command-not-found $argv[1]
end

function cls
    clear
end

# Set fastfetch with Android logo
fastfetch --logo android
EOF

echo -e "${Cyan}* Fish shell configured with Android logo *${Color_Off}\n"

# Set fish as default shell
echo -e "${Green}[*] Setting Fish as default shell...${Color_Off}"
chsh -s fish
echo -e "${Cyan}* Fish set as default shell *${Color_Off}\n"

# Completion message
echo -e "${Green}Setup completed successfully!"
echo -e "Please restart Termux for changes to take effect.${Color_Off}\n"
