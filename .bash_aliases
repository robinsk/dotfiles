# ls
if [ "$(uname -s)" = "Darwin" ]; then
    alias ls='ls -G'

    # colorful ls output
    export CLICOLORS=yes
    export LSCOLORS='ExGxFxdaCxDADAhbadecad'

    # order of color pairs
    # 1.   directory
    # 2.   symbolic link
    # 3.   socket
    # 4.   pipe
    # 5.   executable
    # 6.   block special
    # 7.   character special
    # 8.   executable with setuid bit set
    # 9.   executable with setgid bit set
    # 10.  directory writable to others, with sticky bit
    # 11.  directory writable to others, without sticky bit

    # colors:
    # a     black
    # b     red
    # c     green
    # d     brown
    # e     blue
    # f     magenta
    # g     cyan
    # h     light grey
    # A     bold black, usually shows up as dark grey
    # B     bold red
    # C     bold green
    # D     bold brown, usually shows up as yellow
    # E     bold blue
    # F     bold magenta
    # G     bold cyan
    # H     bold light grey; looks like bright white
    # x     default foreground or background
else
    alias ls='ls --color=auto'
fi
alias l='ls -Alh'
alias ll='ls -lh'

# gnu
alias grep='ggrep --color=auto'
alias find='gfind'

# misc
alias psi='echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"; ps aux|grep -i'
alias ccat='source-highlight -f esc256 -o STDOUT -i'
alias diga='dig +nocmd +multiline +noall +answer'

# git
alias gst='git status'
alias gb='git branch'
alias rebase='git pull --rebase'
alias ci='git commit'
alias co='git checkout'
alias gd='git diff'

# maven
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'

# bundle
alias be='bundle exec'
alias brake='bundle exec rake'

