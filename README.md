```bash
cd ~
git clone https://github.com/OBarronCS/.dotfiles.git

# These lines will fail if they would override existing files
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 
ln -s ~/.dotfiles/.inputrc ~/.inputrc

cd -

# Install tmux bash autocomplete
curl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux | sudo tee /etc/bash_completion.d/tmux > /dev/nullcurl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux | sudo tee /etc/bash_completion.d/tmux > /dev/null


# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

```
