#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo -e "\033[31m =============================================================\033[0m"
echo -e "\033[33m  脚本名：  Transmission一键脚本 for Debian \033[0m"
echo -e "\033[33m *原作者：@http://dadi.me/ dadi.ME \033[0m"
echo -e "\033[33m *此脚本发布在 http://vpsoff.com \033[0m"
echo -e "\033[31m =============================================================\033[0m"
# http://dadi.me/ dadi.ME
# 2013.03.30
# Mod by zhujiwiki.com , 2018.07.06
# Transmission | Debian

# VERSION CHOICE
ver="latest"
echo "Which version(latest OR stable) do you want to install:"
read -p "Type latest or stable (latest):" ver
if [ "$ver" = "" ]; then
	ver="latest"
fi

# CONFIGURATION
username=""
read -p "Set username:" username
if [ "$username" = "" ]; then
	username="vpsoff.com"
fi

password=""
read -p "Set password:" password
if [ "$password" = "" ]; then
	password="vpsoff.com"
fi

port=""
read -p "Set port(1989):" port
if [ "$port" = "" ]; then
	port="1989"
fi

    get_char()
    {
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
    }
    echo ""
    echo "Press any key to start...or Press Ctrl+c to cancel"
    char=`get_char`

# START
apt-get update
apt-get -y install transmission-daemon

# SETTINGS.JSON
/etc/init.d/transmission-daemon stop
wget --no-check-certificate https://github.com/DeanJing/TransmissionForDebian/blob/master/settings.json
chmod +x settings.json
mkdir -p /var/lib/transmission-daemon/info
mv -f settings.json /var/lib/transmission-daemon/info/
sed -i 's/^.*rpc-username.*/"rpc-username": "'$(echo $username)'",/' /var/lib/transmission-daemon/info/settings.json
sed -i 's/^.*rpc-password.*/"rpc-password": "'$(echo $password)'",/' /var/lib/transmission-daemon/info/settings.json
sed -i 's/^.*rpc-port.*/"rpc-port": '$(echo $port)',/' /var/lib/transmission-daemon/info/settings.json
/etc/init.d/transmission-daemon start

# mkdir -p /home/transmission/Downloads/
chmod -R 777 /var/lib/transmission-daemon/downloads

# END
clear
echo "Done."
echo " "
echo "Web GUI: http://your ip:$port/"
echo "username: $username"
echo "password: $password"
echo -e "\033[31m注意：请在VPS安全组以及BT面板里打开端口1989和51413\033[0m"

