apt update && apt install -y wget
wget https://github.com/fatedier/frp/releases/download/v0.46.1/frp_0.46.1_linux_amd64.tar.gz
tar -zxf frp_0.46.1_linux_amd64.tar.gz
chmod +x ./frps
./frps -c ./frps.ini
