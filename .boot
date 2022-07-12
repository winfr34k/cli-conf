#Initialize default variables
source "${HOME}/cli-conf/.environment"
#Machine-local environment
if [ -f "${HOME}/.environment" ]; then
    source "${HOME}/.environment"
fi

#Initialize default aliases
source "${CLI_CONF}/.aliases"
#Machine-local aliases
if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

# vi:syntax=sh

