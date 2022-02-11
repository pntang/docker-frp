FROM ubuntu
RUN apt update && apt install -y wget
WORKDIR /tmp
RUN wget https://github.com/fatedier/frp/releases/download/v0.16.0/frp_0.16.0_linux_amd64.tar.gz
RUN tar -zxf frp_0.16.0_linux_amd64.tar.gz
RUN mv frp_0.16.0_linux_amd64 /var/frp
RUN apt remove -y wget
RUN apt autoremove -y
RUN rm -rf /var/lib/apt/lists/*
RUN echo -e "[common]\nbind_addr = 0.0.0.0\nbind_port = 7000\nvhost_http_port = 80\nvhost_https_port = 443\ndashboard_addr = 0.0.0.0\ndashboard_port = 23333\ndashboard_user = admin\ndashboard_pwd = $DASHBOARD_PASSWORD\ntoken = \nlog_file = ./frps.log\nlog_level = info\nlog_max_days = 3\nheartbeat_timeout = 30\nprivilege_allow_ports = 80,443,2000-6000,8000-23000,40000-60000\nmax_pool_count = 100\nmax_ports_per_client = 0\nauthentication_timeout = 900\ntcp_mux = true" > /var/frp/frps.ini
ENTRYPOINT /var/frp/frps -c /var/frp/frps.ini
EXPOSE 80 443 2000-65535
