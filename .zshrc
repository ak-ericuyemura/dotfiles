# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ericuyemura/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"
ZSH_THEME="philips"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         bundler
         common-aliases
         asdf
         extract
         gem
         colored-man-pages
         dotenv
         ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
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
# Mysql container operations
# Mysql container operations

# configuration options for mysql2 gem
eval `docker-machine env 2>/dev/null`
LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Rails database
export RAILS_MYSQL_USER=root
export RAILS_MYSQL_PASSWORD=password
export ROOT_MYSQL_USER=root
export ROOT_MYSQL_PASSWORD=password

# FZF preferences
# export FZF_DEFAULT_COMMAND="find -L"

. ~/.zshenv
. ~/.mysql_docker_aliases
. ~/.postgres_docker_aliases
. ~/.fms_client_aliases

alias refresh_config='. ~/.zshrc'
alias c='clear'
alias v='nvim'
. $(brew --prefix asdf)/asdf.sh
alias gre="git for-each-ref --sort='''authordate:iso8601''' --format=''' %(authordate:relative)%09%(refname:short)''' refs/heads"
alias be='bundle exec'
alias tn='tmux new'
alias fix_enter='stty icrnl'
alias order66='bundle exec rubocop-git --display-cop-names origin/master...HEAD'
alias build_db='be rails db:setup && be rails db:test:prepare'
alias refresh_touch_bar='killall ControlStrip'
alias aspen_start='cd ~/annkissam/fms_bit_client && tmux new -s aspen'
alias ma_start='cd ~/annkissam/fms_bit_ma && tmux new -s ma'
alias gd='git diff'
alias gca='git commit --amend --no-edit'
alias change_it="git commit -am 'Update CHANGELOG'"

function find_branch() {
  if [ "$1" != "" ]
  then
    gre | grep "$1"
  else
    echo 'give search term for branch matching'
  fi
}

function deploy_staging() {
  if [ "$1" != "" ]
  then
    stty icrnl
    FMS_CLIENT="$1" bundle exec cap staging deploy
  else
    echo 'make sure to give a client to deploy to'
  fi
}

function deploy_production() {
  if [ "$1" != "" ]
  then
    stty icrnl
    FMS_CLIENT="$1" bundle exec cap production deploy
  else
    echo 'make sure to give a client to deploy to'
  fi
}

function test_this() {
  if [[ $1 -gt 1 && "$2" != "" ]]
  then 
    for i in {1..$1}; do be rspec "$2"; done
  else
    echo 'Make sure first argument is a num greater than 1 and second is a string'
  fi
}

function smoosh_code() {
  if [ "$location" != "" ]
  then 
    find ~/annkissam/fms_bit_client/fms_bit/$location -maxdepth 1 -type f  | xargs -I {} mv -n {} ~/annkissam/fms_bit_client/$location
	fi
}

function find_directory() {
  if [ "$1" != "" ]
  then
    find ~/annkissam/fms_bit_client -type d -name "$1"
  else
    echo 'make sure to give a directory name to look for'
  fi
}

function diff_origin() {
  BRANCH_NAME=`git branch | grep \* | cut -d ' ' -f2`
  if [ "$BRANCH_NAME" != "" ]
  then 
    git diff origin/"$BRANCH_NAME"
  fi
}

function vinstall() {
  if [ "$1" != "" ]
  then
    cd ~/.vim/bundle && git clone "$1"
  else
    echo 'Make sure to enter in a git repo between ""'
  fi
}

function pipe_results() {
  if [ "$1" != "" ]
  then
    touch ~/annkissam/todos/"$1"_results.md
    ag "$1" -Q -l > ~/annkissam/todos/"$1"_results.md
  else
    echo 'Make sure to give a searchable result'
  fi
}

function pipe_results_cpma() {
  if [ "$1" != "" ]
  then
    touch ~/annkissam/todos/cpma/"$1"_results.md
    ag "$1" -Q -l > ~/annkissam/todos/cpma/"$1"_results.md
  else
    echo 'Make sure to give a searchable result'
  fi
}

function file_present() {
  if [[ ! -a /Users/ericuyemura/annkissam/fms_bit_client/app/processors/shared/timesheet_processor.rb ]]
  then
    exit 1
  else
    exit 0
  fi
}
function test_file_present() {
  if [[ ! -a /Users/ericuyemura/annkissam/fms_bit_client/app/processors/shared/timesheet_processor.rb ]]
  then
    echo "The file is not present"
  else
    echo "The file is present"
  fi
}

function ask_for_input() {
  read [ REPLY[?This is the question I want to ask?] ]
  echo REPLY
}
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericuyemura/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ericuyemura/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericuyemura/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ericuyemura/google-cloud-sdk/completion.zsh.inc'; fi


function kubessh() {
  if [ $# -eq 0 ]
  then
    kubectl get namespaces
  else
    if [ $# -eq 1 ]
    then
      kubectl get pods --namespace=$1 | egrep -o "[^ ]*app-deployment"
    else
      kube=$(kubectl get pods --namespace=$1 | ruby -ne "puts $& if /$2[\w-]+app-deployment[\w-]+/")
      kubectl exec -it $kube --namespace=$1 -- /bin/bash
    fi
  fi
}
. /usr/local/opt/asdf/libexec/asdf.sh
