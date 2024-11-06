#!/usr/bin/env bash

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
    usr=$1
    app=$2
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

