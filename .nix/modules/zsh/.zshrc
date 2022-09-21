# Created by newuser for 5.8

# Enable colors
autoload -U colors && colors

# History in cache directory:
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Enable autocomplete
autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
promptinit
_comp_options+=(globdots)

# Git prompt settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{magenta} %b '
zstyle ':vcs_info:*' enable git

# This will set the default prompt to the walters theme
PROMPT='%F{yellow}%n%B%F{cyan}⟩ %F{blue}%1~ $vcs_info_msg_0_%F{red}→ '
#RPROMPT='%B%F{cyan}%~'

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim key binds
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-foward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Vim different cursors for different modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# General aliases
alias config='git --git-dir=$HOME/.cfg/dotfiles --work-tree=$HOME'
alias configp='git --git-dir=$HOME/.cfg/dotfiles-private --work-tree=$HOME'
alias ls='ls --color=auto --group-directories-first'
alias gsudo='sudo git -c include.path=$HOME/.config/git/config'
alias j='z'
alias lg='lazygit'
alias lgc='lazygit --git-dir=$HOME/.cfg/dotfiles --work-tree=$HOME'
alias lgp='lazygit --git-dir=$HOME/.cfg/dotfiles-private --work-tree=$HOME'

# Trash aliases
alias tp='trash-put'
alias te='trash-empty'
alias tl='trash-list'
alias tre='trash-restore'
alias trm='trash-rm'

# Plugins
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Keybinds
bindkey '^[[Z' autosuggest-accept
