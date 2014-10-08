source $HOME/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ $(command -v rbenv) ]; then
    eval "$(rbenv init -)"
fi
