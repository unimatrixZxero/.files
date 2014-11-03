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
export PATH=$HOME/script:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/Users/neo/script:/Users/neo/Dropbox/script:/Users/neo/script/perl:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/local/Cellar/node/0.8.8/bin:/usr/local/share/npm/bin:$PATH

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

export EDITOR='subl -w'
fpath=(~/.zsh/Completion $fpath)

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r21
export ANDROID_SDK=/usr/local/Cellar/android-sdk/r21
export ANDROID_NDK_ROOT=/usr/local/Cellar/android-ndk/r8c
export ANDROID_NDK=/usr/local/Cellar/android-ndk/r8c

function motd_1 {
  echo "
  ...,=?777777777777i?+~....
  ..=+++++=+==++?????????777+=....~
  ,..777777?+++,i7777777777777+...:,........
  .~7777?.....+77=+++++++?????+?7777777+~.,+...
  ..777?....?7777777777i???iiii?+i77777........7:.,
  .i77,=:..777........~77777777777777?..i77777....
  .77~....777,.+7777777~.:77777777777:.?77777,...7..
  .77....7777..77777777777.+777777777:.7777777~...7+.
  .=777777777,.777777777777,.777777777.i777777777777,.
  .7777777777.?777i77777777?.777777777.7777777777777..
  .,777777777i.77=....?77777i.777777777.777777777777,...
  .i7777777++..=7.....777777~.777777777:.7777777777..7~.
  .777777+=+??=.?7.:i777777i.?7777777777?............~=.
  ..7777777777+??..:7777777,.i777777777777777..7777777:..
  .:77777777i+77777?.......=777777777777777?.:777?=i7777,.
  .i777777777777777777777777777777777777+...=77,.~=,..i77,.
  .777777777777777777777777777?~::...,=777.:77..?7777i.777.
  .7777777777777777777777777777777i?+=?77..77,...,...+..77.,
  .777777777777777777777777?+++++?i77777..+77.77.7+::.?.77:.
  .77777777777777777777777777i+=++++++77..77:.+=.:===,=.+7.,
  .7777777777777777777777777777777777777.,77,.777777777.,7.
  .7777777777777777777777777?=+=+++++++7..77..777777777.=7.
  .,77i777777777777777777777777777777777i.77,.77777777+.7..
  .77+777+777777777777777777777777777777.~7,.77777777.77.
  .~77+77+777=77777777777777777777777777.~7,.7777777..7,.
  .77?+7+i777=7777777777777777777777777.:7,.7777777.i7..
  .?77++?+7777+777777777777777777777777.~7.:777777?.77..
  ,.777+?+77777?i77777i?++=+77777777777.=7.?777777+.77i.
  .?777++=77777+7777777?++++=i7777777i.7i.77777777.777.
  :.777i+++7777ii77777777777+++777777,.7~.:=?77777.~77.,
  .=777=++?7777?77777777?++?7?+?7777.i7.:7777.:77=.77~.
  .7777+++7777+777777777777++77777..77.i777777.77.i7~,
  ..777++7=777??77777+,=i777i=i777.+77.77777777.7.i7~,
  .~777+7?+7777+77777777:.=77?+?7.777............77~,
  .7777=++i7777?i777777777.~7777.777.77.7+=i=7,.77,,
  .7777+++=i7777+7777777777..7?.777..7..,,?.7.i77.,
  :.77777+77?+i777+i777777777.:.777,.7777~....777.
  ..7777+?777+i777?777777777,.?777,.i7777..777..
  :.?7777i++i+++777777777777..77777,....?777~.
  ..?77777?+++++=iiii77777+.,777777777777,.
  ...7777777i=++++7?==++++~.,77777777,.:
  ...?77777777?+++==??i77~........
  ...,77777777777777777777..
  ,....7777777777......
  ...?7777i:..
  :....,
  "
}

function motd_2 {
  echo "
                                    .M
                                 .:AMMO:
                        .:AMMMMMHIIIHMMM.
              ....   .AMMMMMMMMMMMHHHMHHMMMML:AMF\"
            .:MMMMMLAMMMMMMMHMMMMMMHHIHHIIIHMMMML.
                 \"WMMMMMMMMMMMMMMMMMMH:::::HMMMMMMHII:.
            .AMMMMMMMHHHMMMMMMMMMMHHHHHMMMMMMMMMAMMMHHHHL.
          .MMMMMMMMMMHHMMMMMMMMHHHHMMMMMMMMMMMMMHTWMHHHHHML
         .MMMMMMMMMMMMMMMMMMMHHHHHHHHHMHMMHHHHIII:::HMHHHHMM.
         .MMMMMMMMMMMMMMMMMMMMMMHHHHHHMHHHHHHIIIIIIIIHMHHHHHM.
         MMMMMMMMMMMMMMMMMHHMMHHHHHIIIHHH::IIHHII:::::IHHHHHHHL
         \"MMMMMMMMMMMMMMMMHIIIHMMMMHHIIHHLI::IIHHHHIIIHHHHHHHHML
          .MMMMMMMMMMMMMM\"WMMMHHHMMMMMMMMMMMLHHHMMMMMMHHHHHHHHHHH
         .MMMMMMMMMMMWWMW   \"\"YYHMMMMMMMMMMMMF\"\"HMMMMMMMMMHHHHHHHH.
        .MMMMMMMMMM W\" V                         W\"WMMMMMHHHHHHHHHH
       \"MMMMMMMMMM\".                                 \"WHHHMH\"HHHHHHL
       MMMMMMMMMMF  .                                         IHHHHH.
       MMMMMMMMMM .                                  .        HHHHHHH
       MMMMMMMMMF. .                               .  .       HHHHHHH.
       MMMMMMMMM .     ,AWMMMMML.              ..    .  .     HHHHHHH.
     :MMMMMMMMM\".  .  F\"'    'WM:.         ,::HMMA, .  .      HHHHMMM
     :MMMMMMMMF.  . .\"         WH..      AMM\"'     \"  .  .    HHHMMMM
      MMMMMMMM . .     ,;AAAHHWL\"..     .:'                   HHHHHHH
      MMMMMMM:. . .   -MK\"OTO L :I..    ...:HMA-.             \"HHHHHH
 ,:IIIILTMMMMI::.      L,,,,.  ::I..    .. K\"OTO\"ML           'HHHHHH
 LHT::LIIIIMMI::. .      '\"\"'.IHH:..    .. :.,,,,           '  HMMMH:
HLI'\"IIITMII::.  .         .IIII.     . '\"\"\"\"               ' MMMFT:::.
 HML:::WMIINMHI:::.. .          .:I.     .   . .  .        '  .M\"'.....I.
 \"HWHINWI:.'.HHII::..          .HHI     .II.    .  .      . . :M.',, ..I:
  \"MLI\"ML': :HHII::...        MMHHL     :::::  . :..      .'.'.'HHTML.II:
   \"MMLIHHWL:IHHII::....:I:\" :MHHWHI:...:W,,\"  '':::.      ..'  \":.HH:II:
     \"MMMHITIIHHH:::::IWF\"    \"\"\"T99\"'  '\"\"    '.':II:..'.'..'  I'.HHIHI'
       YMMHII:IHHHH:::IT..     . .   ...  . .    ''THHI::.'.' .;H.\"\".\"H\"
         HHII:MHHI\"::IWWL     . .     .    .  .     HH\"HHHIIHHH\":HWWM\"
          \"\"\" MMHI::HY\"\"ML,          ...     . ..  :\"  :HIIIIIILTMH\"
               MMHI:.'    'HL,,,,,,,,..,,,......,:\" . ''::HH \"HWW
               'MMH:..   . 'MMML,: \"\"\"MM\"\"\"\"MMM\"      .'.IH'\"MH\"
                \"MMHL..   .. \"MMMMMML,MM,HMMMF    .   .IHM\"
                  \"MMHHL    .. \"MMMMMMMMMMMM\"  . .  '.IHF'
                    'MMMML    .. \"MMMMMMMM\"  .     .'HMF
                     HHHMML.                    .'MMF\"
                    IHHHHHMML.               .'HMF\"
                    HHHHHHITMML.           .'IF..
                    \"HHHHHHIITML,.       ..:F...
                     'HHHHHHHHHMMWWWWWW::\"......
                       HHHHHHHMMMMMMF\"'........
                        HHHHHHHHHH............
                          HHHHHHHH...........
                           HHHHIII..........
                            HHIII..........
                             HII.........
                              \"H........
                                ......

                      W H A T - - M E   W O R R Y ?"
}

function motd_3 {
  read -r -d '' VAR <<'EOF'
.
     _ _ _ _ _
    ( " " " " )                    .gggppp.
     l       :                    :$P_  _T$;
     |       |                    (  ,  .  )
     |      _|                     ; '--' :
     |_   _/ l)_                   ;  -- ):
     |(""" `-'  l                  "------"t-.                         ___
     |-'      _.'                 /"j-.-,t' \ \                   .-.C'   "..'
     |        ;                  / .^./ :_"-.\ ;                  ;' ;":--._;-
     :        :      .'.  ______j____J____t___Lj________          :_ :_;   ))
     :"-.__    t  .-.|  ;/       ,-+. ,-----.           \         : "      ";
     :"--._"""/ \/  :\ //        :  : |      \           \   _____;C   )    ;
    .;     ""-`t'\.'\\Y/          ""  |_______;          _j / _| /-.-._____:
   / ;      `. '-/ _///  ,--------.   |_     _:         /  """jj'/-/.____.-:
  : :   \     ;.' /\"y  /         /l  |-"""""-;        /      : / /_  .     ;-.
  ; :    \   /   /  /  /_        / ;   """""""        :    ___:/ // )'      :  ;
  ; ;     \.'"--'  /   \ """""--: /                   |"""" _.; /(.-\    /  :  :
  ; ;             /    /""""---(|/                    | )--|  """"_.-`..'   ;  :
  ; :            /     """""----'                     '--..'--""t"         :   ;
  :  ;          /                                                \         ;  :
   ; :.__      /                                                  \       /   ;
   :  `^$$$pppy                                                    tp._.gj   /
    `.   "^$$P                                                      T$$^'  .'
      ""--._/                                                        \__.-"
          /__________________________________________________________\
EOF

  echo "$VAR"
}

# motd_`ruby -e 'puts rand(1..2)'`
motd_$(( $RANDOM % 3 + 1))

export DISABLE_AUTO_TITLE=true
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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


