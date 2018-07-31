#Initialize default variables and aliases
source "${HOME}/cli-conf/.environment"
source "${CLI_CONF}/.aliases"

#Machine-local aliases
if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

#Activate autojump if it is available
[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh

# vi:syntax=sh
