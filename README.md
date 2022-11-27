```
wget https://raw.githubusercontent.com/OBarronCS/.dotfiles/master/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

##### May need to manually build
cd ~/.vim/plugged/coc.nvim
npm install
cd -
```
