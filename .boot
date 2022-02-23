#Initialize default variables and aliases
source "${HOME}/cli-conf/.environment"
source "${CLI_CONF}/.aliases"

#Machine-local aliases
if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

#Machine-local environment
if [ -f "${HOME}/.environment" ]; then
    source "${HOME}/.environment"
fi

#Activate autojump if it is available
AUTOJUMP_PATH="/etc/profile.d/autojump.sh"
if [ uname = "Darwin" ]; then
    AUTOJUMP_PATH="/usr/local${AUTOJUMP_PATH}"
fi
[ -f $AUTOJUMP_PATH ] && source $AUTOJUMP_PATH

# vi:syntax=sh

