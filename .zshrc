# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="sporty_256"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby textmate brew bundler osx sublime jira zsh-syntax-highlighting fasd)

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/script:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/Users/neo/script:/Users/neo/Dropbox/script:/Users/neo/script/perl:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/local/Cellar/node/0.8.8/bin:/usr/local/share/npm/bin:/Users/neo/www/revolution/bin:$PATH

function food {
  ruby -r "~/Dropbox/script/ruby/food.rb" -e "$1"
}

source ~/Dropbox/script/grep_local_routes.sh

# one'zies
alias e='subl .'
alias o='open .' #open current directory in finder

alias fork='open . -a /Users/neo/Applications/ForkLift.app'

alias phperror='clear;tail -f /var/log/apache2/error_log'

# rails development aliases
alias ss='script/server'
alias rs='bundle install && rake db:migrate && rails server'
alias rc='script/rails console'
alias rg='script/rails generator'
alias sd='script/server --debugger'
alias sg='script/generate'
alias sc='script/console'
alias rr='rake routes'
alias lh3='open http://localhost:3000'
alias syck_shit='RUBYOPT="-rpsych" bundle install'
alias preflight_check='bundle install; rake db:migrate; autotest'

#git stuff
alias eat='clear; git pull ; glg --no-merges --max-count=7'
alias cut='git branch -d'
alias branch='git co -b'
alias hard_reset='git reset --hard && git clean -d -f'
alias gti='git'
alias bashws="git ci -m 'bash trailing whitespace'"
alias gdf='git diff'

# mage stuff
alias mconfig='cat app/etc/local.xml'

# sound it out
alias bell='mpg123 /Users/safi/Dropbox/sounds/campfire_horn.mp3'
alias beep='bell'
alias notify='say "command completed"'

# 4 t3h LULz
alias crap='cap'
alias poop='git push'
alias dick='dig'


#export LOLCOMMITS_DEVICE='FaceTime HD Camera (Display)'
export LOLCOMMITS_ANIMATE=2
export LOLCOMMITS_FORK=1
export EDITOR='subl -w'
# enable speaking deploy messages
export TALKTOMEBABY=1

fpath=(~/.zsh/Completion $fpath)

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r21
export ANDROID_SDK=/usr/local/Cellar/android-sdk/r21
export ANDROID_NDK_ROOT=/usr/local/Cellar/android-ndk/r8c
export ANDROID_NDK=/usr/local/Cellar/android-ndk/r8c

export DISABLE_AUTO_TITLE=true
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

eval "$(rbenv init -)"

function _update_ruby_version()
{
    typeset -g ruby_version=''
    if which rbenv &> /dev/null; then
      ruby_version="$(rbenv version-name)"
    fi
}
chpwd_functions+=(_update_ruby_version)

function howoften()
{
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

REPORTTIME=2                # report time if execution exceeds amount of seconds
export CC=/usr/bin/gcc

function showlogo() {
  if [[ -n $SKIP_LOGO && $SKIP_LOGO == "true" ]]; then
    return 0
  fi

  if [[ -d ~/.files/logos ]]; then
    LOGOS=( ~/.files/logos/* )
    cat $LOGOS[$RANDOM%$#LOGOS+1]
  else
    figlet -f larry3d `hostname -s`
  fi

  echo ""
}

showlogo
archey
