#Initialize
source "${HOME}/cli-conf/.boot"

#Theme
ZSH_THEME="cloud"

#Using case-sensitive completion
CASE_SENSITIVE="true"

#Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

#Hack to make VCS status checking faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

#Include brew-specific site functions
if command -v brew > /dev/null; then
    ZSH_CUSTOM="/usr/local/share/zsh/site-functions"
fi

# Plugins to load for zsh
if [ "$(uname)" = "Darwin" ]; then
    plugins=(git macos sudo)
else
    plugins=(git sudo)
fi

#Load the oh-my-zsh config
source "${ZSH}/oh-my-zsh.sh"

#Execute stuff post-load
source "${CLI_CONF}/.postsh"

