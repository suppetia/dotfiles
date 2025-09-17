log_file=~/install_progress_log.txt


sudo apt-get -y install git
if type -p git> /dev/null; then
    echo "git Installed" >> $log_file
else
    echo "git FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

# fix installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# install addons
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "oh-my-zsh Installed" >> $log_file

# install the Nerd Font "Hack"
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash -s -- --silent
if type -p zsh > /dev/null; then
    echo "getnf Installed" >> $log_file
    getnf -i Hack
    echo "NerdFont 'Hack' Installed" >> $log_file
else
    echo "getnf FAILED TO INSTALL!!!" >> $log_file
    echo "NO NerdFont INSTALLED!!!"
fi



# sudo apt-get -y install python3-neovim
# sudo apt-get -y install ninja-build gettext cmake unzip curl build-essential
curl -O https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
export $PATH:${PWD}/nvim-linux64/bin
if type -p nvim > /dev/null; then
    echo "nvim Installed to ${PWD}/nvim-linux64/bin which is added to PATH" >> $log_file
else
    echo "nvim FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python3-dev python3-pip
python3 -m pip install pynvim




#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file

# based on: https://github.com/mattjmorrison/dotfiles/
