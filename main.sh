apt update && apt install -y wget
wget https://github.com/fatedier/frp/releases/download/v0.16.0/frp_0.16.0_linux_amd64.tar.gz
tar -zxf frp_0.16.0_linux_amd64.tar.gz
mv frp_0.16.0_linux_amd64 /var/frp
rm -rf /var/frp/frps.ini
mv frps.ini /var/frp/frps.ini
./var/frp/frps -c /var/frp/frps.ini
