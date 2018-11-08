source $HOME/.bashrc

if [ $(command -v rbenv) ]; then
    eval "$(rbenv init -)"
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
