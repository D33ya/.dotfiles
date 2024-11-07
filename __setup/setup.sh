#!/usr/bin/env bash
set -euo pipefail

# find which package manager then update
release_file=/etc/os-release

if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
    sudo apt update
    sudo apt dist-upgrade
fi


if grep -q "Arch" $release_file
then 
    sudo pacman -Syu
fi


# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# packages to install in the $HOME dir
home=(
    bash starship git
)

# packages to install in ./config
config=(
    nvim yazi btop cosmic gh hypr kitty lazygit qtile ranger
)

pwd

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    local usr=$1
    local app=$2
    # -v verbose
    # -R restow
    # -t target
    stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${home[@]}; do
    stowit "${HOME}" $app 
done

# install only user space folders
for app in ${config[@]}; do
        stowit "${HOME}"/.config $app 
done

echo ""
echo "##### ALL DONE"

