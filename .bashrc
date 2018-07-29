#Initialize
source "${HOME}/cli-conf/.boot"

#Activate a couple of modules in FSMaxB's .bashrc
FREESPACE=''
GITBRANCH=''

#Include FSMaxB's .bashrc
source "${FSMAXB}/.bashrc-common"

#Execute stuff post-load
source "${CLI_CONF}/.postsh"
