#!/usr/bin/env bash

#profile_snap="$(/opt/homebrew/bin/gdate +%s%3N)"
#function profile_time() {
#    local prev="$profile_snap"
#    profile_snap="$(/opt/homebrew/bin/gdate +%s%3N)"
#    local desc="$1"
#    local time_taken=$(( $profile_snap - $prev ))
#    echo "${time_taken}ms $desc"
#}

if [[ -f /usr/local/bin/brew ]]; then
    BREW_DIR="/usr/local"
    export BREW_DIR
elif [[ -f /opt/homebrew/bin/brew ]]; then
    BREW_DIR="/opt/homebrew"
    export BREW_DIR
fi

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#
# general stuff
#
# update window size after every command
shopt -s checkwinsize

#
# better bash history
#
# don't put duplicate lines or lines starting with space
export HISTCONTROL="erasedups:ignoreboth"

# append to history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=200000
export HISTFILESIZE=300000

# enable incremental history search with up/down arrows (also Readline goodness)
# http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

#
# smarter tab completion (readline bindings)
#
# perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

#
# path
#
if [[ -d "$BREW_DIR/opt/python/libexec/bin" ]]; then
    export PATH="$BREW_DIR/opt/python/libexec/bin:$PATH"
fi
if [[ -d "$BREW_DIR/bin" ]]; then
    export PATH="$BREW_DIR/bin:$PATH"
fi
export PATH="$HOME/bin:$PATH"

#
# less config
#
# -F: exit if output fits on screen
# -X: don't send termcap init/deinit string (necessary with -F)
# -R: show ansi colors (don't escape them)
export LESS="-FXR"
if command -v src-hilite-lesspipe.sh > /dev/null; then
    export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi

#
# java
#
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true"


#
# gpg
#
GPG_TTY=$(tty)
export GPG_TTY

#
# colored prompt
#
export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0;33m\]$(__git_ps1)\[\e[0m\]\$ '

#
# iterm
#
if [ -n "$ITERM_SESSION_ID" ]; then
    # set current folder as iterm title
    # \e]: escape sequence incoming!
    # 0; set both and title (1=only tab, 2=only title)
    # ${PWD##*/} the last dir of #PWD
    # \a BEL escape sequence done, signal to iterm
    # shellcheck disable=SC2016
    SET_ITERM_TITLE='echo -ne "\e]0;${PWD##*/}\a"'
    export PROMPT_COMMAND="$SET_ITERM_TITLE;$PROMPT_COMMAND"
fi

if [ -f ~/.bash_aliases ]; then
    # shellcheck disable=SC1090
    . ~/.bash_aliases
fi

# read global bash-completion
# this has to go in the end, because the way to load completions
# has changed recently, and will not load unless interactive etc etc
export BASH_COMPLETION_COMPAT_DIR="$BREW_DIR/etc/bash_completion.d"
if [[ -r "$BREW_DIR/etc/profile.d/bash_completion.sh" ]]; then
    # shellcheck disable=SC1091
    . "$BREW_DIR/etc/profile.d/bash_completion.sh"
fi

#
# local overrides (.bashrc.local isn't in the dotfiles repo)
#
if [ -f ~/.bashrc.local ]; then
    # shellcheck disable=SC1090
    . ~/.bashrc.local
fi
