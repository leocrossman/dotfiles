# .dotfiles

A quick note to self/anyone using my config: I will likely make this an install script in the future for ease of use, but given there are only a few manual steps, combined with not having the time to bother figuring out how to add an SSH key on GitHub from the command line, it's not practical for me now. In the future when I inevitably have too many RaspberryPi's or similar, I'll dedicate some time to it then rather than solving a problem I do not currently have.

## Ordered Instructions
### **Git**
#### _Generating a new SSH Key_
1. From the command line:
```sh
cd .ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
```
2. When prompted to "Enter a file in which to save the key," press Enter.
3. At the prompt "Enter passphrase", type a secure passphrase.
#### _Add the SSH key to the ssh-agent_
1. Ensure the ssh-agent is running manually:
```sh
eval "$(ssh-agent -s)"
```
2. Add the SSH private key to the ssh-agent.
```sh
ssh-add ~/.ssh/id_ed25519
```
3. Log the public key to the console:
```sh
cat ~/.ssh/id_ed25519.pub
```
4. Copy the key outputted to the clipboard.
5. Go to GitHub ➡ Settings ➡ SSH and GPG keys ➡ New SSH key.
6. Enter a name for the Key, paste in the public key, and click "Add SSH key."
7. Clone this repo to the root directory.

### **Create the symbolic link for all dotfiles**
```zsh
cd ~
ln -s ~/.dotfiles/* .
```

### **ZSH**
1. Install ZSH
```sh
sudo apt-get update sudo apt-get install zsh -y
```
2. Change the default shell to ZSH (add sudo to change shell for root instead of working user)
```zsh
chsh -s $(which zsh)
```
3. Set `$HOME` environment variable if it is not already defined (check with `echo $HOME`) to root directory e.g.
```zsh
echo 'export HOME=home/username' >> ~/.zshenv
```
4. Install oh-my-zsh
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. Install powerlevel10k
```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
5. Source `.zshrc` or restart the terminal
```zsh
source ~/.zshrc
```
### **TMUX**
1. Install TMUX
```zsh
sudo apt install tmux
```
2. Install TPM
```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
3. To fetch and install plugins listed in `.tmux.conf`, while in TMUX, press `prefix` + `I`.
4. If TMUX was already running when installing TPM:
```zsh
tmux source ~/.tmux.conf
```
