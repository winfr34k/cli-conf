#!/bin/bash
#Initialize
source "${HOME}/cli-conf/.boot"

#Prepare the computer, install brew etc.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install htop tmux vim tree wget cmake iperf python3 rbenv sqlite ssh-copy-id wakeonlan youtube-dl 

#Remove any annoying already existing file
rm "${HOME}/.bash_profile"
rm "${HOME}/.bashrc"
rm "${HOME}/.zshrc"
rm -rf "${HOME}/.vim"
rm "${HOME}/.vimrc"
rm -f "${HOME}/.config/htoprc"

#Make a new .config directory for the htoprc to live in
mkdir "${HOME}/.config"

#Create some softlink to get most stuff setup
ln -s "${CLI_CONF}/.bash_profile" "${HOME}"
ln -s "${CLI_CONF}/.bashrc" "${HOME}"
ln -s "${CLI_CONF}/.zshrc" "${HOME}"
ln -s "${FSMAXB}/.vim" "${HOME}"
ln -s "${FSMAXB}/.vimrc" "${HOME}"
ln -s "${HOME}/.vim" "${HOME}/.nvim"
ln -s "${HOME}/.vimrc" "${HOME}/.nvimrc"
ln -s "${FSMAXB}/htoprc" "${HOME}/.config"

#Hack for FSMaxB's .bashrc
ln -s "${FSMAXB}/.ansi-colors" "${HOME}"

#Launch the freshly configures shell
if [[ $BASH == *"bash"* ]]; then
	source "${HOME}/.bash_profile"
elif [[ $ZSH_NAME == *"zsh"*  ]]; then
	source "${HOME}/.zshrc"
else
	echo "ERROR: No suitable shell config found!"
fi
