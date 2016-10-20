# Colors!
set     red="%{\033[1;31m%}"
set   green="%{\033[4;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}"

set prompt="${yellow}%n${white}@${green}%m${end}${red} [%c]${end}${white} % "

set promptchars="%#"

alias tmux  tmux -2
alias ls ls -G 
alias ll ls -al
set autolist
