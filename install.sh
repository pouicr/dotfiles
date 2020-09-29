#! /usr/bin/env bash
# Link Git, Vim and tmux configurations

echo $# $1

files=(".bash_profile" ".gitconfig" ".vimrc" ".tmux.conf" ".bashrc")
for file in "${files[@]}"; do
  echo "$HOME/$file"
  if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ] ; then
    if [ "$1" == "-f" ] ; then
      rm "$HOME/$file"
      echo "rm $HOME/$file"
    else
      mv "$HOME/$file" "$HOME/$file.old"
      echo "mv $HOME/$file"
    fi
  fi
  echo "link $(pwd)/$file to $HOME/$file"
  ln -s "$(pwd)/$file" "$HOME/$file"
done;

# Install Vim plugins with Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo | vim +PluginInstall +qall 2> /dev/null
