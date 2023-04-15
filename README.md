```
cd ~
git clone https://github.com/OBarronCS/.dotfiles.git

# These lines will fail if they would override existing files
ln -s ~/.dotfiles/.tmux.conf ~/.vimrc 
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 

cd -

# Install Vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

# May need to manually build
cd ~/.vim/plugged/coc.nvim
npm install
cd -
```
