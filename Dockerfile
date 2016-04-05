FROM logstash:2
MAINTAINER Matej Cotman <matej@proxima.si>

RUN curl -o nodesource-setup.sh -L https://deb.nodesource.com/setup
RUN bash ./nodesource-setup.sh

RUN apt-get update
RUN apt-get install -y nodejs gcc g++ git make wget tar bzip2 python-setuptools
RUN rm -rf /var/lib/apt/lists/*
RUN easy_install supervisor

RUN mkdir -p "$HOME/.npm" && \
    chmod -R +rwx "$HOME/.npm"

RUN git clone git://github.com/matejc/frontail && \
    cd frontail && \
    npm install

RUN touch /var/log/all.log && rm /frontail/preset/default.json
ADD logstash.conf /etc/logstash/logstash.conf
ADD supervisord.conf /etc/supervisord.conf
ADD preset.json /frontail/preset/default.json

EXPOSE 80 5000
ENTRYPOINT supervisord -c /etc/supervisord.conf && \
  tail -f /tmp/supervisord.log
