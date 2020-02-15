start_timestamp=$(/usr/local/bin/gdate +%s%3N)

source $HOME/.bashrc

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# read global bash-completion
# this has to go in the end, because the way to load completions
# has changed recently, and will not load unless interactive etc etc
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    . "/usr/local/etc/profile.d/bash_completion.sh"
fi

end_timestamp=$(/usr/local/bin/gdate +%s%3N)
let time_taken=$end_timestamp-$start_timestamp
echo "Load time ${time_taken}ms"