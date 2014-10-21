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

# colored less
if [ -f "/usr/local/bin/src-hilite-lesspipe.sh" ]; then
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi

# path
export PATH=$HOME/bin:$PATH

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.awt.headless=true"
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
    alias java6="export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)"
    alias java7="export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)"
    alias java8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"
fi

# mac-specific
if [ "$(uname -s)" = "Darwin" ]; then
    # cli colors
    export CLICOLORS=yes
    export LSCOLORS='ExGxFxdaCxDADAhbadecad'
fi

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
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# colored prompt
export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[0m\]\$ '

