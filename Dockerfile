FROM alpine:3.2
MAINTAINER Albert Dixon <albert@dixon.rocks>

ADD https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /sync.tgz
RUN tar -xvzf /sync.tgz -C /usr/local/bin btsync \
    && rm -vf /sync.tgz

ADD https://github.com/albertrdixon/tmplnator/releases/download/v2.2.1/t2-linux.tgz /t2.tgz
RUN tar -xvzf /t2.tgz -C /usr/local/bin && rm -vf /t2.tgz

ADD configs /templates
ADD scripts/* /usr/local/bin/
RUN chmod a+rx /usr/local/bin/* &&\
    mkdir -p /data

ENTRYPOINT ["docker-entry"]
CMD ["docker-start"]

EXPOSE 8888 55555
ENV UI_PORT     8888
ENV LISTEN_PORT 55555
