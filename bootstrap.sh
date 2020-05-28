#!/bin/bash
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm python-pynvim
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm curl
sudo pacman -S --noconfirm stow
sudo pacman -S --noconfirm fzf
sudo pacman -S --noconfirm ctags
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm gdb


mkdir -p ~/install_dir
if [ ! -d "~/install_dir/yay" ] 
then 
    git clone https://aur.archlinux.org/yay.git ~/dotfiles
fi


curl -L http://install.ohmyz.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
rm ~/.zshrc


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo pacman -S --noconfirm npm
sudo pacman -S --noconfirm python-pylint
sudo pacman -S --noconfirm autopep8
sudo pacman -S --noconfirm python-virtualenv



yay -S --noconfirm bear
sudo pacman -S --noconfirm ccls

yay -S --noconfirm lscolors-git

yay -S --noconfirm rustup
rustup toolchain install stable
rustup default stable
rustup component add rls rust-analysis rust-src

sudo npm install -g neovim

stow ctags
stow zsh
stow powerlevel10k
stow nvim

nvim --headless +'PlugInstall --sync' +qall


LINE='/usr/sbin/zsh'
FILE='/etc/shells'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" | sudo tee -a /etc/shells
chsh -s $(which zsh)
zsh -l
