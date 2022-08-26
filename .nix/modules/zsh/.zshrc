# Created by newuser for 5.8

# Enable colors
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh_history
#HISTDUP=erase
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

# Spaceship prompt settings
#autoload -U promptinit; promptinit
#prompt spaceship
#SPACESHIP_PROMPT_ADD_NEWLINE=false
#SPACESHIP_PROMPT_SEPARATE_LINE=false
#SPACESHIP_USER_SHOW=always
#SPACESHIP_USER_PREFIX=""
#SPACESHIP_HOST_SHOW=needed
#SPACESHIP_DIR_PREFIX=""
#SPACESHIP_VI_MODE_SHOW=false
#SPACESHIP_PROMPT_ORDER=(
  #host          # Hostname section
  #user          # Username section
  #dir           # Current directory section
  #git           # Git section (git_branch + git_status)
  #jobs          # Background jobs indicator
  #char          # Prompt character
#)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim key binds
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-foward-char
bindkey -M menuselect 'j' vi-down-line-or-history
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

# NNN cd on exit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# General aliases
alias config='git --git-dir=$HOME/.cfg/dotfiles --work-tree=$HOME'
alias configp='git --git-dir=$HOME/.cfg/dotfiles-private --work-tree=$HOME'
alias ls='ls --color=auto --group-directories-first'
alias n='n -e -D'
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

# Git aliases
alias gs='git status'
alias gl='git log --decorate --pretty=format:"%h - %an, %ar : %s"'
alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
alias gc='git commit -m'
alias gp='git push origin'

# Config git aliases
alias gcs='config status'
alias gcl='config log --decorate --pretty=format:"%h - %an, %ar : %s"'
alias gca='config add'
alias gcaa='config add -A'
alias gcau='config add -u'
alias gcc='config commit -m'
alias gcp='config push origin'

# Plugins
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Keybinds
bindkey '^[[Z' autosuggest-accept

# Zsh syntax highlighting should go last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
