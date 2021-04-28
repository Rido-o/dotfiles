#!/bin/zsh

# Xinit location
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

# ZSH folder location
export ZDOTDIR="$HOME/.config/zsh"

#XDG base directory locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Path
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/bin/scripts":$PATH
export PATH="$HOME/.local/bin/dwm":$PATH
export PATH="$HOME/.local/bin/statusbar":$PATH

export PATH="$HOME/.local/bin/themes":$PATH
export PATH="$HOME/.local/bin/themes/colors":$PATH
export PATH="$HOME/.local/bin/themes/fonts":$PATH

export PATH="$HOME/.local/bin/cronjobs":$PATH
export PATH="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug":$PATH

# Environment variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export PAGER="most"
export AUDIOPATH="$HOME/Audio"

# $HOME cleanup
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export MOST_INITFILE="$XDG_CONFIG_HOME/most/mostrc"
export _Z_DATA="$XDG_DATA_HOME/z"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Weechat settings
export WEECHAT_HOME="$HOME/.config/weechat"

# NNN settings
export LC_COLLATE="C"
export NNN_PLUG_PLUGINS="d:fzcd;f:fzopen;j:fzz"
export NNN_PLUG_COMMANDS='s:_git status;u:_git add -u;c:_git commit;p:_git push origin master;l:_lazygit*;e:_sudoedit $nnn*'
export NNN_PLUG="$NNN_PLUG_PLUGINS;$NNN_PLUG_COMMANDS"
export NNN_TRASH=1

# Pfetch settings
export PF_INFO="ascii title os host kernel uptime pkgs memory shell wm editor palette"

# GTK theme
export GTK_THEME=Nordic:dark
