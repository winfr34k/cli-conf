#!/bin/bash
#Initialize
source "${HOME}/cli-conf/.boot"

#Prepare the computer, install brew etc.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install htop tmux vim tree watch unzip openssl httpie jq tig wget cmake iperf python3 ipython rbenv rustup-init swiftlint sqlite ssh-copy-id autojump vim emacs kubernetes-cli
brew tap buo/cask-upgrade
brew cask install freac macdown mumble playonmac zenmap

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
mv /usr/local/bin/composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

curl https://sh.rustup.rs -sSf | sh

#Remove any annoying already existing file
rm "${HOME}/.ansi-colors"
rm "${HOME}/.bash_profile"
rm "${HOME}/.bashrc"
rm "${HOME}/.zshrc"
rm "${HOME}/.vim"
rm "${HOME}/.vimrc"
rm "${HOME}/.nvim"
rm "${HOME}/.nvimrc"
rm "${HOME}/.config/htoprc"
rm "${HOME}/.gitconfig"

#Make a new .config directory for the htoprc to live in
mkdir "${HOME}/.config"

#Create some default directories that I expect on a system
mkdir "${HOME}/Sites"
mkdir "${HOME}/repos"
mkdir "${HOME}/DockerData"
mkdir "${HOME}/noreturn"
mkdir "${HOME}/demo"

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

#Configure vim as per FSMaxB's definiton
hash vim 2> /dev/null && vim +PlugInstall +qall
hash vim 2> /dev/null && vim +GitGutterEnable +qall

#Configure git
cp "${CLI_CONF}/.gitconfig" "${HOME}"
vim "${HOME}/.gitconfig"

#Launch the freshly configured shell
if [[ $BASH == *"bash"* ]]; then
	source "${HOME}/.bash_profile"
elif [[ $ZSH_NAME == *"zsh"*  ]]; then
	source "${HOME}/.zshrc"
else
	echo "ERROR: No suitable shell config found!"
fi

echo "All done!"
echo "Another interesting thing to install SDKMAN, but this should be done manually."

