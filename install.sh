#!/bin/bash
#Initialize
source "${HOME}/cli-conf/.boot"

if [ "$(uname)" = "Darwin" ]; then
	#Prepare the computer, install brew etc.
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	#Get access to versioned casks
	brew tap homebrew/cask-versions

	#Get access to fonts
	brew tap homebrew/cask-fonts

	brew install htop tmux vim loc watch httpie jq wget iperf3 nmap python3 rbenv rustup-init php composer golang swiftlint sqlite autojump emacs kubernetes-cli mas
	brew install --cask firefox freac macdown keepassxc font-jetbrains-mono jetbrains-toolbox

	#Install Java
	brew install --cask temurin17

	#Install Rust
	rustup-init --default-toolchain stable --profile default --no-modify-path -y
else
	echo "Skipping installation of packages as we're not on a Mac."
fi

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
mkdir "${USER_BIN_PATH}"
mkdir "${SITES_PATH}"
mkdir "${REPOS_PATH}"
mkdir "${GO_PATH}"
mkdir "${DOCKER_DATA_PATH}"
mkdir "${DEMO_PATH}"

#Create some softlink to get most stuff setup
ln -s "${CLI_CONF}/.bash_profile" "${HOME}"
ln -s "${CLI_CONF}/.bashrc" "${HOME}"
ln -s "${CLI_CONF}/.zshrc" "${HOME}"
ln -s "${CLI_CONF}/.vim" "${HOME}"
ln -s "${CLI_CONF}/.vimrc" "${HOME}"
ln -s "${HOME}/.vim" "${HOME}/.nvim"
ln -s "${HOME}/.vimrc" "${HOME}/.nvimrc"
ln -s "${CLI_CONF}/htoprc" "${HOME}/.config"

#Hack for FSMaxB's .bashrc
ln -s "${CLI_CONF}/.ansi-colors" "${HOME}"

#Configure vim as per FSMaxB's definiton
hash vim 2> /dev/null && vim +PlugInstall +qall
hash vim 2> /dev/null && vim +GitGutterEnable +qall

#Configure git
cp "${CLI_CONF}/.gitconfig" "${HOME}"
vim "${HOME}/.gitconfig"

#Launch the freshly configured shell
if [ ! -z "$BASH" ]; then
	source "${HOME}/.bash_profile"
elif [ ! -z "$ZSH_NAME" ]; then
	source "${HOME}/.zshrc"
else
	echo "ERROR: No suitable shell config found!"
fi

echo "All done!"
echo "Another interesting thing to install SDKMAN, but this should be done manually."

