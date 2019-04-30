FROM kouinkouin/debian-base

ARG NODEJS_VERSION=10

RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg             | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_"$NODEJS_VERSION".x stretch main" > /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main"       > /etc/apt/sources.list.d/yarn.list && \
    apt update && \
    apt install -y nodejs yarn && \
    apt clean && \
    rm -r /var/lib/apt/lists/*

ENV UID=33 GID=33 HOME=/var/www

ADD files/run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

ENTRYPOINT ["run"]

