
# Link Zsh, Git, Vim and tmux configurations
files=(".gitconfig" ".vim" ".vimrc" ".tmux.conf" ".bashrc")
for file in "${files[@]}"; do
  if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
    if [ "$1" = "-f" ]; then
      rm "$HOME/$file"
    else
      mv "$HOME/$file" "$HOME/$file.old"
    fi
  fi
  ln -s "$(pwd)/$file" "$HOME/$file"
done;

# Install Vim plugins with Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo | vim +PluginInstall +qall 2> /dev/null
