#alias ssh='TERM=xterm ssh'

alias cp="cp -i" # confirm before overwriting something
alias df='df -h' # human-readable sizes
alias more=less
alias neofetch="neofetch --config $HOME/dotfiles/config1.conf --ascii $HOME/dotfiles/locky-ascii.txt"
alias sudovi='sudo -E nvim'
alias tarc="tar -cvzf"
alias tard="tar -xvzf"
alias cd3="cd ../../.."
alias cd2="cd ../.."
alias tmuxs="tmux new -s"
#alias vim="nvim"

# Last/Current directory
# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# scripts
# alias denoserver="~/.config/nvim/deno-node-server.ts"
alias deno-git-init="$HOME/dotfiles/scripts/deno-git-init.ts"
alias node-init="$HOME/dotfiles/scripts/node-git-ts-init.lua"
alias astro-dependencies="$HOME/dotfiles/scripts/astro-dependencies.lua"
