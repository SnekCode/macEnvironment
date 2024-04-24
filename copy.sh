BASEDIR=$(dirname "$0")
# rm ~/.zshrc ~/.zsh_aliases ~/.vimrc ~/.tmux.conf
ln $BASEDIR/.tmux.conf ~
ln $BASEDIR/.vimrc ~
ln $BASEDIR/.zshrc ~
ln $BASEDIR/.zsh_aliases ~
