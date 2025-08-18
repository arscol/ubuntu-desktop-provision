# EndeavourOS provision scripts

(Install OS without Desktop Environment)

### Initial update

```
sudo pacman -Syu
yay -Syu
```

### Install some utilities with pacman

```
sudo pacman -S fastfetch ghostty git curl zsh zellij neovim lazygit fd ripgrep npm thefuck hugo transmission-cli mpv docker docker-compose proton-vpn-gtk-app brightnessctl hyprland hyprpaper gcc base-devel make networkmanager
```

### Install some utilities with yay

```
yay -S lazydocker unimatrix-git
```

### Set default shell to Zsh

```
chsh -s $(which zsh)
```

### Install Oh My Zsh!

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Install Rust and Taplo

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
cargo install taplo-cli
```

### Install Node.js utilities and update versions

```
sudo npm i -g n prettier eslint tree-sitter-cli
sudo n stable
sudo npm i -g npm
```

### Enable Docker daemon

```
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
sudo usermod -aG docker $USER
newgrp docker
```

### **If NVIDIA GPU (this step may differ between GPU models)**:

 - Install necessary packages.
 - Run `Hyprland` once to generate the config file.
 - Make necessary changes to Hyprland config.
 - Rebuild initramfs if necessary.
 - Run `sudo reboot`.

### Generate SSH Key

```
ssh-keygen
```

### Final cleanup

```
sudo pacman -Scc
yay -Scc
yay -Yc
```
