FROM alpine:3.7
MAINTAINER kolehank kolehank@gmail.com

# 换为国内镜像，以加速docker image制作速度，非中国镜内用户请注释掉下一行
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories
RUN echo '@community http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories
RUN echo '@testing http://mirrors.aliyun.com/alpine/edge/testing' >> /etc/apk/repositories
RUN echo '@edgecommunity http://mirrors.aliyun.com/alpine/edge/community' >> /etc/apk/repositories

RUN apk update && apk upgrade

#时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 软件包安装
RUN apk add redis

# 端口号配置
EXPOSE 6379

# 容器命令执行
CMD ["redis-server", "--requirepass", "w4dRpZY6ioXgva4Nhp0y", "--bind", "127.0.0.1"]
