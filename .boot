#Initialize default variables and aliases
source "${HOME}/cli-conf/.environment"
source "${CLI_CONF}/.aliases"

# Machine-local aliases
if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

# vi:syntax=sh
