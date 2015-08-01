FROM alpine:3.2
MAINTAINER Kyle James Walker <KyleJamesWalker@gmail.com>

RUN apk add --update git ruby-dev nodejs gcc musl-dev make libffi-dev && \
    wget http://production.cf.rubygems.org/rubygems/rubygems-2.4.8.zip -q -O /tmp/gems.zip && \
    unzip /tmp/gems.zip -q -d /tmp && \
    cd /tmp/rubygems-2.4.8 && \
    ruby setup.rb && \
    cd / && \
    rm -rf /tmp/rubygems-2.4.8 /tmp/gems.zip && \
    gem install rubygems-update && \
    gem install jekyll && \
    apk del git gcc musl-dev make && \
    rm -rf /var/cache/apk/*

WORKDIR /code
COPY . /code

CMD ["jekyll", "build"]
