# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="sporty_sam"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# enable speaking deploy messages
export TALKTOMEBABY=1

# report time if execution exceeds amount of seconds
export REPORTTIME=2

export EDITOR='vim'
export LC_ALL='en_US'
export DISABLE_AUTO_TITLE=true
export CC=/usr/bin/gcc
export COMPLETION_WAITING_DOTS="true"
export SPRING_ON=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby textmate brew osx sublime jira zsh-syntax-highlighting fasd)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/script:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/Users/neo/script:/Users/neo/Dropbox/script:/Users/neo/script/perl:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/local/Cellar/node/0.8.8/bin:/usr/local/share/npm/bin:$PATH

# one'zies
alias e='subl .'
alias o='open .' #open current directory in finder
alias vi=$EDITOR

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
alias tests='npm test && parallel_rspec spec'

#git stuff
alias eat='clear; git pull ; glg --no-merges --max-count=7'
alias poop='git push'
alias cut='git branch -d'
alias branch='git co -b'
alias hard_reset='git reset --hard && git clean -d -f'
alias gti='git'
alias bashws="git ci -m 'bash trailing whitespace'"
alias gdf='git diff'
alias gst='rubocop-git ; git status'

# sound it out
alias bell='mpg123 ~/Dropbox/sounds/campfire_horn.mp3'
alias beep='bell'
alias notify='say "command completed"'

# misc
alias cal='ncal'
alias caly='ncal -y'

# 4 T3H LOLZ
alias cat='bat'

fpath=(/usr/local/share/zsh-completions $fpath)

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

function showlogo() {
  if [[ -n $SKIP_LOGO && $SKIP_LOGO == "true" ]]; then
    return 0
  fi

  if [[ -d ~/.files/logos ]]; then
    LOGOS=( ~/.files/logos/* )
    /bin/cat $LOGOS[$RANDOM%$#LOGOS+1]
  else
    figlet -f larry3d `hostname -s`
  fi

  echo ""
}

showlogo
istats

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
