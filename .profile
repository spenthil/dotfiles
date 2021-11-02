alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH
export PATH=$HOME/homebrew/bin:$PATH
export PATH="~/bin:${PATH}"

export ENV=development

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

export PATH="$HOME/.poetry/bin:$PATH"

source $HOME/.aliases
source $HOME/.secrets
