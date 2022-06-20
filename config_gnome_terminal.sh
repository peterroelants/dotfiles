#!/usr/bin/env bash

# Set gnome-terminal profile
# Use dconf an gsettings
#
# gsettings examples:
# -Get list of schemas:
#   `gsettings list-schemas | sort``
# - Get keys for a schema:
#   `gsettings list-keys org.gnome.desktop.interface`
# - Set a key:
#   `gsettings set org.gnome.desktop.interface font-name "Sans 10"`
# 
# conf examples:
# - Get all teminal profiles:
#   `dconf dump /org/gnome/terminal/legacy/profiles:/`
# - Dump specific profile:
#   `dconf dump /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ > test.profile`
# - Load specific profile:
#   `dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < wention.profile`
# - Set specific setting:
#   `dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font "'Ubuntu Mono Regular 13'"`
#

script_path=$(realpath $0)
echo $script_path
dotdir=$(dirname $script_path)
echo $dotdir
profile_uud="f5727b7e-884e-417c-9189-10c414ff2bda"

# Load profile
dconf load /org/gnome/terminal/legacy/profiles:/:${profile_uud}/ < ${dotdir}/profiles/custom.profile

# Update list
PROFILE_LIST=$(gsettings get org.gnome.Terminal.ProfilesList list)

if [[ $PROFILE_LIST == *"${profile_uud}"* ]]; then
    echo "profile is already in the list!"
else
    gsettings set org.gnome.Terminal.ProfilesList list "${PROFILE_LIST%]*}, '${profile_uud}']"
    echo "Added profile to the list."
fi

# Set profile to default
gsettings set org.gnome.Terminal.ProfilesList default ${profile_uud}
