### Add Neovim unstable PPA

```
sudo add-apt-repository ppa:neovim-ppa/unstable
```

### Initial update

```
sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade
```

### Install some utilities

```
sudo apt -y install git curl fastfetch zsh nvim ripgrep fd-find nodejs npm thefuck transmission gnome-tweaks hugo libssl-dev pkg-config build-essential ca-certificates

```

### Set default shell to Zsh

```
chsh -s $(which zsh)
```

### Install Oh My Zsh!

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Install Ghostty and set it as default terminal emulator

```
sudo snap install ghostty --classic
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which ghostty) 50
sudo update-alternatives --set x-terminal-emulator $(which ghostty)
```

### Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
```

### Install Zellij

```
cargo install --locked zellij
```

### Install Lazygit

```
# For Ubuntu 25.04 and earlier
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# For Ubuntu 25.10 and later
sudo apt install lazygit
```

### Install vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Install Node.js utilities and update versions

```
sudo npm i -g n prettier eslint
sudo n stable
sudo npm i -g npm
```

### Install more utilities

```
sudo snap install vlc
sudo snap install spotify
```

### Install Docker

```
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
```

### Install ProtonVPN

```
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb
sudo apt -y update
sudo apt -y install proton-vpn-gnome-desktop libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator
```

### Generate SSH Key

```
ssh-keygen
```

### Final cleanup

```
sudo apt -y autoclean
sudo apt -y autoremove
```
