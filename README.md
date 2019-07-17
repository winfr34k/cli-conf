# cli-conf
The configurations files I use in order to get comfortable with the CLI.

## How to checkout/pull
**Note**: As this is a repository containing so-called "submodules" (aka git repositorys inside of git repositorys) it's important you understand how to check this repository out (cloning) or pull it.

### Cloning this repository
Simply do `git clone --recursive https://github.com/winfr34k/cli-conf.git`.  
This will download oh-my-zsh (a "framework" I use to build my zsh config upon).

### Pulling this repository (aka updating it)
If you want to be up to date with the config, just do:

1. `git submodule update --remote` 
2. `git pull` 

...and be good to go!

**WARNING:** You need to do this inside your home folder (`~` or `$HOME`).

## How to install
Run `./~/cli-conf/install.sh`.

**WARNING:** This installer is highly experimental and, for now, **OS X ONLY**!
