# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# Check and perform installs (To be moved to independent install scripts in the future):
# if oh-my-zsh is not installed, install it
if [ ! -d $HOME/.oh-my-zsh ] ; then
    echo "No oh-my-zsh installation found. Installing..." >&2
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# powerlevel10k
if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] ; then
    echo "No powerlevel10k installation found. Installing..." >&2
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install scripts - installs only if not found
# Changes permissions to be executable
#chmod +x ~/.dotfiles/scripts/ubuntu/bash/install_fortune.sh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] ; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/pa/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Plugins first -> PATH to oh-my-zsh -> source oh-my-zsh.sh
plugins=(git npm node 1password colored-man-pages colorize)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# set default editor
# export EDITOR="code -w" # vscode
export EDITOR="vi" # vi
alias v="nvim"
# fix_wsl2_interop() {
#    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
#         if [[ -e "/run/WSL/${i}_interop" ]]; then
#             export WSL_INTEROP=/run/WSL/${i}_interop
#         fi
#     done
# }

# fix_wsl2_interop

# make command_not_found active in zsh since it is not by default
# [[ -a "/etc/zsh_command_not_found" ]] && . /etc/zsh_command_not_found

# ------------ run these on startup ------------
# echo $ZSH_THEME
alias say="fortune | cowsay  -f \"$(ls /usr/share/cowsay/cows | sort -R | head -1)\" | lolcat"

unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# launch tmux on startup
# if which tmux 2>&1 >/dev/null; then
#   if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ]; then
#     tmux new-session -A -s main;
#   fi
# fi

# aliases

# get ip
alias myip="curl http://ipecho.net/plain; echo"
# open file explorer gui
alias e="explorer.exe ."
alias vi="vim"

# enter postgres user
# sudo -u postgres -i
# enter psql cli
alias pg="sudo -u postgres psql"
# /statusstart/stop psql server
alias pstatus="sudo service postgresql status"
alias pstart="sudo service postgresql start"
alias pstop="sudo service postgresql stop"



alias mg="mongosh"
alias mstatus="sudo service mongod status"
alias mstart="sudo service mongod start"
alias mstop="sudo service mongod stop"

alias c="clear"
alias n="nvim"
alias so="source ~/.zshrc"

alias clean_nm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

# color stuff
# alias show_colors="zsh ~/.dotfiles/ubuntu/scripts/zsh/display_terminal_colors.zsh"
d=.dircolors
test -r $d && eval "$(dircolors $d)"

# typingtest config
#bash ./tt_config.sh
# Produces a test consisting of 40 random words drawn from your system's dictionary.
alias ttr="shuf -n 20 /usr/share/dict/words|tt"
# Produces a test consisting of a random quote.
alias ttq="curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]'|tt -quotes -"
# Creates an alias called ttd which keeps a log of progress in your home directory`.
alias ttd="tt -n 40 -csv >> ~/wpm.csv"

# Generate Password
alias gen_pass="tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo ''"

alias draft_dir="mkdir drafts && echo '*' > ./drafts/.gitignore"

# EC2 shortcut
alias ec2-Mmreal-env="ssh -i ~/.ssh/mm-ec2-key.pem ec2-user@ec2-44-200-245-30.compute-1.amazonaws.com"

#ZSH_COLORIZE_STYLE="colorful"


#open anything in WSL
alias eye="xdg-open"
# open chrome from wsl terminal
alias open='"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
# symlink chrome into wsl from windows drive
#sudo ln -s /mnt/c/Program\ Files\ (x86)/Microsoft/Edge/Application/msedge.exe /usr/bin/edge
#mkdir -p /usr/bin/chrome && ln -sn "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" /usr/bin/chrome

# alias ls='pwd; ls --color' # Alias 'ls' to: pwd + ls + color.
alias ls='ls --color' # Alias 'ls' to: pwd + ls + color.

#deno install
export DENO_INSTALL="/home/leoadmin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

fpath+=~/.zfunc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# zoxide -> Better version of `z`
eval "$(zoxide init zsh)"
alias cd="z"

# Configure ssh forwarding
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
# need `ps -ww` to get non-truncated command for matching
# use square brackets to generate a regex match for the process we want but that doesn't match the grep command running it!
ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
if [[ $ALREADY_RUNNING != "0" ]]; then
    if [[ -S $SSH_AUTH_SOCK ]]; then
        # not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
        echo "removing previous socket..."
        rm $SSH_AUTH_SOCK
    fi
    echo "Starting SSH-Agent relay..."
    # setsid to force new session to keep running
    # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi

# bun completions
[ -s "/home/leoadmin/.bun/_bun" ] && source "/home/leoadmin/.bun/_bun"

# Bun
export BUN_INSTALL="/home/leoadmin/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Dotfiles
alias dot="/usr/bin/git --git-dir=/home/leoadmin/dotfiles.git --work-tree=/home/leoadmin"
# Hides all the untracked files in the output
dot config --local status.showUntrackedFiles no
# only show hidden files
alias l.="ls -A | egrep '^\.'"

