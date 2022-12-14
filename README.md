# .dotfiles

## Install:
- For now, you must install and change shells to ZSH before running the following command.
```sh
git clone --bare https://github.com/leocrossman/dotfiles.git $HOME/dotfiles.git && git --git-dir=$HOME/dotfiles.git --work-tree=$HOME checkout -f HEAD && source $HOME/.zshrc
```

## Optional:
### **Git via SSH**
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
