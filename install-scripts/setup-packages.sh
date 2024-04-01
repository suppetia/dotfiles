#!/bin/zsh
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#
#===============================================================================

#==============
# Variables
#==============
dotfiles_dir=${HOME}/dotfiles
log_file=${HOME}/install_progress_log.txt

 
#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.zshrc > /dev/null 2>&1
# sudo rm -rf ~/.bashrc > /dev/null 2>&1
# sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
# sudo rm -rf ~/.gitconfig > /dev/null 2>&1


mkdir -p ${HOME}/.config
#==============
# Create symlinks in the home folder
#==============
ln -sf $dotfiles_dir/nvim ${HOME}/.config/nvim
ln -sf $dotfiles_dir/zsh/.zshrc ${HOME}/.zshrc
ln -sf $dotfiles_dir/zsh/.p10k.zsh ${HOME}/.p10k.zsh
# ln -sf $dotfiles_dir/vim ~/.vim
# ln -sf $dotfiles_dir/vimrc ~/.vimrc
# ln -sf $dotfiles_dir/bashrc ~/.bashrc
# ln -sf $dotfiles_dir/linux-tmux ~/.tmux
# ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt
# ln -sf $dotfiles_dir/config ~/.config


#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file

# based on: https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/create-symlinks.sh
