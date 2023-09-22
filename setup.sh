#!/bin/bash

# These lines will fail if they would override existing files
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 
ln -s ~/.dotfiles/.inputrc ~/.inputrc

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Sudo often not in containers
if command -v sudo &> /dev/null
then
    # Start sudo timeout
    echo "Running sudo to start timeout to install tmux autocomplete"
    sudo echo "Thanks!" 

    # Install tmux bash autocomplete
    curl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux | sudo tee /etc/bash_completion.d/tmux > /dev/null
fi
 
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

# Install tmux plugin manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins

