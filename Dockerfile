FROM kouinkouin/debian-base:10

ARG NODEJS_VERSION=10

RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_"$NODEJS_VERSION".x buster main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

ENV UID=33 GID=33 HOME=/var/www

ADD files/run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

ENTRYPOINT ["run"]

