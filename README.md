# TransmissionForDebian
Transmission一键脚本，适用于Debian8
### 本人重新改的全自动脚本，装完即可用本地GUI连接
> github地址：https://github.com/DeanJing/TransmissionForDebian
- 自动配置setting文件，关闭DHT，关闭本地连接白名单；
- 一键安装，可全部回车下一步，下一步；
- 默认用户名：vpsoff.com;密码：vpsoff.com

```shell
apt-get update -y
wget --no-check-certificate https://raw.githubusercontent.com/DeanJing/TransmissionForDebian/master/TransmissionForDebian.sh
sh TransmissionForDebian.sh

```
### 装完后用Transmission Remote Gui连接即可
![](https://i.loli.net/2019/08/02/5d43a8881592055710.jpg)
- 默认关闭DHT
- 默认开启允许远程连接
- 端口：1989
- 默认用户名：vpsoff.com
- 默认用户名：vpsoff.com

