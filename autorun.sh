#!/bin/sh
#2016.05.27 by kshuang

file="vimrc gitconfig tmux.conf cshrc"

remove="false"
linkpath="$(cd "$(dirname $0)" && pwd)"
homepath="$(cd ~ && pwd )"

Usage()
{

cat << EOF
    
    This script create softlink of config file in your home directory to config file under dotfile directory
    by default, if config file in directory already exist, it will be renamed to .xxx.old
    use -r to remove exist config instead rename
    
EOF

    exit
}


while getopts r op ; do
    case $op in
        r)
            remove="true" ;;
        ?)
            Usage;;
    esac
done

for config in $file;do
    if [ -f "$homepath/.$config" ]; then
        if [ "$remove" = "false" ]; then 
            mv "$homepath/.$config" "$homepath/.$config.old"
        else
            rm -f "$homepath/.$config"
        fi
    fi
    
    ln -s "$linkpath/$config" "$homepath/.$config"
done

