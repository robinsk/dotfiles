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

# read system-wide bashrc if it exists
bash_prefix=$(dirname $(dirname $(which bash)))
if [ -f "$bash_prefix/etc/bashrc" ]; then
    . "$bash_prefix/etc/bashrc"
fi
unset bash_prefix

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
# colored less
#
if [ -f "/usr/local/bin/src-hilite-lesspipe.sh" ]; then
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi

#
# path
#
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH

#
# java
#
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.awt.headless=true"
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    alias java7="export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)"
    alias java8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"
fi

#
# mac-specific stuff
#
if [ "$(uname -s)" = "Darwin" ]; then
    # cli colors
    export CLICOLORS=yes
    export LSCOLORS='ExGxFxdaCxDADAhbadecad'
fi

#
# other includes
#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /usr/local/etc/bash_completion ]; then
    # this will also load ~/.bash_completion if it exists
    . /usr/local/etc/bash_completion
fi
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

#
# colored prompt
#
export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[0m\]\$ '

#
# local overrides (.bashrc.local isn't in the dotfiles repo)
#

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
