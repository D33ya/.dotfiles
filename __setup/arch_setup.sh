#!/usr/bin/env bash
set -euo pipefail

base=(
base-devel # Basic tools to build Arch Linux packages
multilib-devel # Basic tools to build Arch Linux multilib packages
zsh # shell
yazi # terminal file manager
starship # command prompt style
ripgrep
fzf
github-cli
ffmpeg
npm
)

text_editor=(
neovim
vim
)

terminal=(
kitty
ghostty
)

xorg=(
xorg-server
autorandr
)

xorg_window_manager=(
qtile
picom
)

wayland=(
hyprland
rofi
)

desktop_bar=(
waybar
)

cli_tools=(
lazygit
btop
yubikey-manager-qt
yubikey-manager
bat
zoxide
bitwarden-cli
pandoc-cli
cmatrix
)

networking=(
ufw
)

audio=(
pipewire
pavucontrol
)

gui_programs=(
gimp
qbittorrent
sqlitebrowser
thunderbird
bitwarden
)

proton=(
protonvpn
protonmail-bridge
proton-vpn-gtk-app
)

display_server=(xorg wayland)

aur=(
eww
zen-browser-bin
)

# install fonts
# nvidia drivers

install=(${base} ${text_editor} ${terminal} ${xorg} ${xorg_window_manager} ${wayland} ${desktop_bar} ${cli_tools} ${networking} ${audio} ${gui_programs} ${proton} ${display_server})

echo "Welcome to D33ya's setup script"

echo "updating system"
sudo pacman -Syu $install


# install programming languages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install netbird
curl -fsSL https://pkgs.netbird.io/install.sh | sh

# install yay aur package manager
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


