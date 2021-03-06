# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
export DEFAULT_USER=`id -un`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(asdf git aws terraform kubectl lein docker pipenv autojump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacsclient'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $(thefuck --alias)
function e(){
  emacsclient --alternate-editor='' --create-frame $1 & disown %+
}
function de(){
    # This needs chemacs: https://github.com/plexus/chemacs
    emacs --with-profile doom $1 & disown %+
}
export MAIL='/var/mail/carl'
alias cb="xclip -sel clip"
alias pwgen2cb="pwgen -s 20 -c 1 | cb"
function o(){
  xdg-open $1 > /dev/null 2>&1& disown %+
}
docker-tags(){
    i=0
    while [ $? == 0 ]
    do 
        i=$((i+1))
        curl https://registry.hub.docker.com/v2/repositories/library/$1/tags/?page=$i 2>/dev/null|jq -r '."results"[]["name"]'
    done
}
# jq with colored pagination
jqjq() {
    jq -C "$@" | less -FR
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

GOPATH=~/.go
export GOPATH
PATH=$PATH:$GOPATH/bin
source ~/.ottorc
export GRAALVM_HOME=~/opt/graalvm-ce-19.2.1
alias tf=terraform
function idea(){
    nohup idea $@ > /dev/null & 
}
function update-all-repos(){
    # This needs the following lines in .mrconfig:
    # [DEFAULT]
    # git_up = 
    # git stash -q || true
    # git pull --rebase
    # git stash pop -q 2>/dev/null || true
    mr -j ${nproc} -s up
}
