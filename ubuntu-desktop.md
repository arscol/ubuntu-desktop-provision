# Ubuntu Desktop provision scripts

(These provision scripts are valid for Ubuntu Desktop 25.10 and won't be longer updated.)

### Add Neovim unstable PPA

```
sudo add-apt-repository ppa:neovim-ppa/unstable
```

### Initial update

```
sudo apt -y update
sudo apt -y full-upgrade
```

### Install some utilities

```
sudo apt -y install git curl fastfetch zsh nvim lazygit ripgrep fd-find nodejs npm thefuck transmission vlc gnome-tweaks gnome-shell-extension-manager hugo libssl-dev pkg-config build-essential ca-certificates

Install extension "Dash To Panel" from GNOME Extensions Manager.
```

### Set default shell to Zsh

```
chsh -s $(which zsh)
```

### Install Oh My Zsh!

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Ghostty and set it as default terminal emulator

```
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/home:clayrisser:sid.list
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_clayrisser_sid.gpg > /dev/null
sudo apt update
sudo apt install ghostty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which ghostty) 50
sudo update-alternatives --set x-terminal-emulator $(which ghostty)
```

### Install Rust and Taplo

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install taplo-cli
```

### Install Zellij

```
cargo install --locked zellij
```

### Install Lazydocker

```
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
```

### Install vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Install Node.js utilities and update versions

```
sudo npm i -g n prettier eslint
sudo n stable
sudo npm i -g npm
```

### Install UniMatrix

```
sudo curl -L https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -o /usr/local/bin/unimatrix
sudo chmod a+rx /usr/local/bin/unimatrix
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
