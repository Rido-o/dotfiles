# Rice
## Overview
The purpose of this repository is to provide all of the necessary scripts and documentation to create a complete install of my system.
## Installation process
To begin make sure that you have a completely fresh arch install ready with and internet connection and git installed. The instructions to achieve such an install are included in REDACTED. After which clone this repository into wherever you please.

`git clone https://github.com/Rido-o/Rice.git $HOME/.cache/rice`

After cloning the repository run the included install script.

`$HOME/.cache/rice/install`

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
* switch repository origins with - ~/.cache/rice/ssh-switch
### Nvim final touches
* open nvim to begin installation of coc-extensions
* run the following command while in a c/c++ file ~ :CocCommand clangd.install
### Bitwarden
* login to bitwarden to enable support for it in qutebrowser
* bw login
### Import Greasemonkey script settings
* open 4chan and import settings for 4chanx and oneechan
* the settings are located in $HOME/.cache/rice/patches
