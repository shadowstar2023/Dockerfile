# 使用官方的 Ubuntu 镜像作为基础
FROM ubuntu:latest

# 更新 apt 包列表
RUN apt-get update -y

# 安装必要的软件包
RUN apt-get install -y openssh-server sudo

# 设置root用户密码
RUN echo 'root:your_password' | chpasswd

# 创建一个新用户（例如 "appuser"），设置密码
RUN useradd -m -s /bin/bash appuser && \
    echo 'appuser:star861206' | chpasswd && \
    adduser appuser sudo

# 启动 SSH 服务
CMD ["/usr/sbin/sshd", "-D"]

# 暴露 SSH 端口
EXPOSE 22
