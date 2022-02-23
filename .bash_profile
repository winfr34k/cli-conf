#Initialize
source "${HOME}/cli-conf/.boot"

#If there are bash completions by brew, include them
if command -v  brew > /dev/null; then
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
fi

#If there's a .bashrc, include it
if [ -f "${HOME}/.bashrc" ]; then
	source "${HOME}/.bashrc"
fi

