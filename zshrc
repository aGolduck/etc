# Path to your oh-my-zsh installation.
export ZSH=$HOME/dev/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(apt autojump brew brew-cask cabal colored-man colorize emacs gem git git-extras git-flow git-flow-avh git-hubflow git-prompt git-remote-branch gitfast github gitignore gnu-utils history node npm nvm osx pip python sudo zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

USER_BIN_PATH="/usr/local/bin:/usr/sbin"
SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin"
RUBY_GEM_PATH="/usr/local/opt/ruby/bin"
PYTHON_PATH=""
HASKELL_PATH=""

export PATH="$USER_BIN_PATH:$SYSTEM_BIN_PATH"

export MANPATH="/usr/local/man:$MANPATH"

# ruby gem path
#export PATH=/usr/local/opt/ruby/bin:$PATH
# python pip path, is this necessary?
#export PATH=/usr/local/lib/python2.7/site-packages:$PATH
# haskell cabal path
#export PATH=~/.cabal/bin:$PATH
# latex path
#export PATH=/usr/texbin:$PATH
# homemade
#export PATH=~/bin:$PATH
# CUDA
#export PATH=/Developer/NVIDIA/CUDA-7.5/bin:$PATH
#export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.5/lib:$DYLD_LIBRARY_PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/Karabiner'
alias cocoaEmacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias vmi='vim'
echo "Use -v!\nUse ts instead of rm!"

#export NVM_DIR="/Users/wenpin/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
