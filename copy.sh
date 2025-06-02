BASEDIR=$(dirname "$0")
REPODIR=$(realpath "$BASEDIR")
# rm ~/.zshrc ~/.zsh_aliases ~/.vimrc ~/.tmux.conf
ln -f $BASEDIR/.tmux.conf ~
ln -f $BASEDIR/.zshrc ~
ln -f $BASEDIR/.zsh_zoxide ~
ln -f $BASEDIR/.zsh_fzf ~
ln -f $BASEDIR/.zsh_aliases ~
ln -sf "$REPODIR/nvim" ~/.config/nvim

# tmux source ~/.tmux.conf
ln -f "$BASEDIR/nvim/treemux_init.lua" ~/.tmux/plugins/treemux/configs/treemux_init.lua