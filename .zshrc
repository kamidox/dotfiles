PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    zmodload zsh/datetime
    setopt PROMPT_SUBST
    PS4='+$EPOCHREALTIME %N:%i> '

    logfile=$(mktemp zsh_profile.XXXXXXXX)
    echo "Logging to $logfile"
    exec 3>&2 2>$logfile

    setopt XTRACE
fi

# If you come from bash you might have to change your $PATH.
# Profile: hardcode path instead of $(brew --prefix coreutils) to improve zsh startup time
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH";

# Add Android Environment
export ANDROID_HOME="$HOME/tools/android-sdk"

# Add java home
export JAVA_HOME=$(/usr/libexec/java_home)

# Add maven
export PATH="$PATH:$HOME/tools/apache-maven-3.6.1/bin"

# Add PhantomJS
export PATH="$PATH:$HOME/tools/phantomjs/bin"
# Add Flutter & Dart
export PATH="$PATH:$HOME/tools/flutter/bin:$HOME/tools/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Add go
export PATH=$PATH:/usr/local/go/bin
# Use aliyun go mirror
export GOPROXY=https://mirrors.aliyun.com/goproxy/

# Workaround FIX: jupter notebook bugs https://github.com/jupyter/notebook/issues/2438
export BROWSER=open

# brew binary mirror: tsinghua
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  osx
  autojump
)


source $ZSH/oh-my-zsh.sh

# User configuration

source $HOME/.aliases
source $HOME/.exports

setopt no_nomatch

# source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

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

if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt XTRACE
    exec 2>&3 3>&-
fi

