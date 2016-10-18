#!/bin/sh

OS=$(uname)

if [ "$OS" = 'FreeBSD' ]; then
    echo 'OS is FreeBSD'
    cpu=$(sysctl -n hw.model | sed -e 's/CPU//' | tr -s ' '|uniq)
    mem=$(($(sysctl -n hw.physmem) / 1024 / 1024))
    uname=$(uname -srmi)
    pkg install figlet

elif [ "$OS" = 'Linux' ]; then
    echo 'OS is Linux'
    cpu=$(cat /proc/cpuinfo |grep "model name" | awk -F ":" '{print $2}'|sed -e 's/ \+/ /g' -e 's/^ //'|uniq)
    mem=$(free -m | grep Mem:|awk '{print $2}')
    uname=$(uname -sr)
    apt-get install figlet

else
    echo 'Please run this script on FreeBSD or Linux hosts.'
    exit 1;
fi

if [ ! $1 ] ; then
    banner=$(hostname -s)
else
    banner=$1
fi

color=$(printf '\033[32;1m')
finish=$(printf '\033[m')
font="slant"

echo > /etc/motd
figlet -f "$font" "$banner" | sed \
-e "2s/$/   $uname/" \
-e "4s/$/   CPU: $cpu/" \
-e "5s/$/   MEM: $mem MB/" \
-e "s/.*/$color&$finish/g" >> /etc/motd
