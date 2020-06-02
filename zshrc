export ZSH=/Users/smalet/.oh-my-zsh
ZSH_THEME=robbyrussell
export UPDATE_ZSH_DAYS=14
plugins=(git)

# User configuration

export PATH="/Users/smalet/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH:"

source $ZSH/oh-my-zsh.sh

export EDITOR='subl'

# Git alias
alias gs="git status"
alias gd="git diff"
alias gch="git checkout"
alias gc="git commit"
alias ga="git add"
alias gpr="git pull --rebase"
alias gpom="git push origin master"
alias gp="git pull --rebase && git push"
alias be="bundle exec"
alias ys="yarn start"

alias nocors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security"

# what is my ip again?
whatismyip() { curl -s http://ipv4.icanhazip.com/ | tr -d '\n' ; if [ -t 1 ] ; then echo; fi }

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"

mkpw() {
  reqlength=${1:-20}
  randomstr=`head /dev/urandom | uuencode -m - | sed -n 2p | tr -d '/+' | cut -c1-${reqlength} | tr -d '\n';`
  punctchar="_"
  insertpos=`awk -v min=1 -v max=$reqlength 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  echo $randomstr | sed s/./\\$punctchar/$insertpos | tr -d '\n' ; if [ -t 1 ] ; then echo; fi
}
