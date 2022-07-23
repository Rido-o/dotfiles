# Dotfiles
## Overview
The purpose of this repository is to provide all of the necessary scripts and documentation to create a complete install of my system.
## Installation process
To begin make sure that you have a completely fresh arch install ready with an internet connection and wget installed. The instructions to achieve such an install are included in REDACTED. Run the following command. Make sure to run it as a user and not root.

`sh <(wget -qO- https://raw.githubusercontent.com/Rido-o/dotfiles/master/.cfg/install/install)`

This will install and setup the vast majority of the system with just a few remaining manual things to take care of.
## Manual Requirements
### Setup SSH keys
* ~ ssh-keygen -t ed25519 -C "Rido@airmail.cc"
* hit enter
* enter passphrase if one is wanted
* ~ eval \`ssh-agent -s\`
* ~ cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
* with the key in the clipboard add it to your github account
* ~ ssh -T git@github.com # test connection
* switch repository origins with - ~/.cfg/install/extras/ssh-switch
### Install private repository
* requires ssh key to be correctly setup
* run `$HOME/.cfg/install/install-private`
### Nvim final touches
* open nvim to begin installation of coc-extensions
* run the following command while in a c/c++ file ~ :CocCommand clangd.install
### Bitwarden
* login to bitwarden to enable support for it in qutebrowser
* bw login
### Import Greasemonkey script settings
* open 4chan and import settings for 4chanx and oneechan
* the settings are located in $HOME/.cfg/install/qutesettings
### Edit Transmission settings
* open ~/.config/transmission-daemon/settings.json and change the usernames in that file to the one you are using
### Set language settings
* run ibus-setup
* add anthy as an input method
* change keybinds according to language help file
