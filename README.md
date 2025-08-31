# 🚀 Termux Enhanced Shell

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![Platform](https://img.shields.io/badge/Platform-Termux-blue.svg)](https://termux.com/)

Transform your Termux experience with an enhanced Zsh shell featuring superior auto-completion, syntax highlighting, and Fish-like auto-suggestions.

## ✨ Features

### 🎯 **Superior Auto-completion**
- **Smart completions** - Context-aware command and file suggestions
- **Case-insensitive** - Works with any case combination (`cd /DA[TAB]` → `/data/`)
- **Menu navigation** - Use arrow keys to navigate through completion options
- **Package completion** - Smart completion for `pkg` and `apt` commands

### 🔮 **Auto-suggestions**
- **History-based suggestions** - See previous commands as you type
- **Real-time completion** - Suggests commands from your command history
- **Accept suggestions** - Press → (right arrow) to accept suggestions

### 🌈 **Syntax Highlighting**
- **Real-time coloring** - Commands are colored as you type them
- **Error detection** - Invalid commands show in red
- **Path highlighting** - Existing paths are highlighted differently

### ⚡ **Enhanced Navigation**
- **Auto-cd** - Type directory name without `cd` command
- **Smart directories** - Spell correction for directory names
- **Quick navigation** - `..`, `...`, `....` shortcuts for parent directories

### 🎨 **Visual Improvements**
- **Android logo** - Custom fastfetch display with Android branding
- **Colored output** - Enhanced `ls`, `grep`, and other command colors
- **Git integration** - Git status in prompt when in repositories

## 🔧 Installation

### Quick Install
curl -fsSL https://raw.githubusercontent.com/yourusername/termux-enhanced-shell/main/install.sh | bash

### Manual Install
Download the script
wget https://raw.githubusercontent.com/yourusername/termux-enhanced-shell/main/install.sh

Make it executable
chmod +x install.sh

Run the installer
./install.sh

### What it installs
- **Zsh** - Modern shell with advanced features
- **Oh My Zsh** - Framework for managing Zsh configuration
- **Plugins** - Auto-suggestions, syntax highlighting, completions
- **Fastfetch** - System information display with Android logo
- **Figlet** - ASCII art for the installation banner

## 📖 Usage

### Auto-completion Examples
Command completion
pk[TAB] → pkg
pkg ins[TAB] → pkg install
git st[TAB] → git status

File completion
ls /da[TAB] → ls /data/
cd ~/Do[TAB] → cd ~/Downloads/

Case-insensitive
CD /DA[TAB] → cd /data/
LS -L[TAB] → ls -la
### Auto-suggestions
- Start typing any previous command to see suggestions
- Press → (right arrow) to accept the suggestion
- Press ↓ (down arrow) to see more suggestions

### Enhanced Navigation
Auto-cd (no need to type 'cd')
/data/data → automatically changes directory
Downloads → cd ~/Downloads

Quick navigation
.. → cd ..
... → cd ../..
.... → cd ../../..

## 🔄 After Installation

1. **Restart Termux** - Close and reopen Termux completely
2. **Enjoy enhanced features** - All features are automatically active
3. **Test completion** - Try the examples above

## 🛠️ Customization

### Changing the Theme
Edit `~/.zshrc` and change:
ZSH_THEME="robbyrussell" # Change to your preferred theme

### Adding Custom Aliases
Add to your `~/.zshrc`:
Custom aliases
alias mycommand='your command here'
alias ll='ls -la --color=auto'
### Modifying Fastfetch Logo
Change the logo in `~/.zshrc`:
Available logos: `android`, `arch`, `ubuntu`, `debian`, `kali`, `tux`, etc.

## 🐛 Troubleshooting

### Auto-completion not working
Reload Zsh configuration
source ~/.zshrc

Check if plugins are loaded
echo $plugins
### Commands not found
Update package database
pkg update

Reinstall missing packages
pkg install zsh figlet fastfetch

### Reset to default
Backup and reset configuration
mv ~/.zshrc ~/.zshrc.backup
mv ~/.oh-my-zsh ~/.oh-my-zsh.backup
Reinstall
curl -fsSL https://raw.githubusercontent.com/yourusername/termux-enhanced-shell/main/install.sh | bash

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

### Development Setup
 LICENSE
MIT License

Copyright (c) 2025 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
