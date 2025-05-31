BASEDIR=$(dirname "$0")
REPODIR=$(realpath "$BASEDIR")
# rm ~/.zshrc ~/.zsh_aliases ~/.vimrc ~/.tmux.conf
ln $BASEDIR/.tmux.conf ~
# ln $BASEDIR/.zshrc ~
ln $BASEDIR/.zsh_aliases ~
ln -sf "$REPODIR/nvim" ~/.config/nvim

tmux source ~/.tmux.conf
ln "$BASEDIR/nvim/treemux_init.lua" ~/.tmux/plugins/treemux/configs/treemux_init.lua