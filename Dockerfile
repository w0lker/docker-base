FROM ubuntu:xenial
MAINTAINER "w0lker" <w0lker.tg@gmail.com>

RUN apt-get update && apt-get -y install localepurge language-pack-zh-hans \
&& rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure -f noninteractive localepurge \
&& locale-gen zh_CN.UTF-8 en_US.UTF-8
ENV LC_CTYPE zh_CN.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get -y install tzdata && rm -rf /var/lib/apt/lists/*
RUN echo "Asia/Shanghai" > /etc/timezone && rm /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

CMD ["/bin/bash"]
