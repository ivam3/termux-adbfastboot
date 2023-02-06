#!/data/data/com.termux/files/usr/bin/bash
IFS=$'\n\t'
trap ctrl_c 2

command -v wget >/dev/null || {
	echo -en "Installing dependencies ...  "
	yes|apt install wget coreutils gnupg &>/dev/null &
	echo -en "Done\b"
}
[[ -d ${PREFIX}/etc/apt/sources.list.d ]] || {
	mkdir -p ${PREFIX}/etc/apt/sources.list.d;
}
wget --tries=20 --quiet \
	https://raw.githubusercontent.com/ivam3/termux-packages/gh-pages/ivam3-termux-packages.list \
	-O ${PREFIX}/etc/apt/sources.list.d/ivam3-termux-packages.list
apt update && yes|apt upgrade && yes|apt install adbfastboot

d=$(dirname $0|awk -F "/" '{print $NF}')
[[ $d = "termux-adbfastboot" ]] && { rm -rf $(dirname $0);}
####::: REPORT ISSUES AT https://t.me/Ivam3_Bot :::####
