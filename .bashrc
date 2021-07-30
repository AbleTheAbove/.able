#############
# ~/.bashrc #
#############
[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
xhost +local:root > /dev/null 2>&1 #Pipe all xhost errors to /dev/null
complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases


####################
# Manual Additions #
####################

###################
# Useful Commands #
###################
#Generate a random string/password
alias genpass="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
# Makes new Dir and jumps inside
mcd () { mkdir -p "$1" && cd "$1"; }

# Move up x number of directories
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

########
# ANSI #
########
RED="\[\e[0;38;5;196m\]"
GREEN="\[\e[0;92m\]"
BLUE="\[\e[0;38;5;51m\]"
GREY="\[\e[0;37m\]"
RESET="\[\e[0m\]"

#########
# PROMT #
#########
PROMPT="${RED}~> ${RESET}"
LINE_ONE="[${GREEN}\w${RESET}]\n"
LINE_TWO="${GREEN}\u${GREY}@${BLUE}\h ${PROMPT}"
PS1="${LINE_ONE}${LINE_TWO}"
PS2="${PROMPT}"

###############
# Git Aliases #
###############
alias gcl="git clone"
alias gc="git commit"
alias ga="git add"
alias gp="git push"
alias gu="git pull"

#################
# List Variants #
#################
alias la="ls -a"
alias labc='ls -lap --color' #alphabetical sort

########
# Rust #
########
. "$HOME/.cargo/env"

#####################
# History managment #
#####################
# See: https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
HISTCONTROL=ignoredboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/able/Desktop/gb-studio/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/able/Desktop/gb-studio/node_modules/tabtab/.completions/electron-forge.bash