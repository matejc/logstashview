#!/bin/sh

test -z "$HTTP_PASSWORD" || sed -i "s/HTTP_PASSWORD/$HTTP_PASSWORD/" /etc/logstash/logstash.conf
test -z "$FRONTAIL_PASSWORD" || sed -i "s/FRONTAIL_PASSWORD/$FRONTAIL_PASSWORD/" /etc/supervisord.conf

supervisord -c /etc/supervisord.conf && tail -f /tmp/supervisord.log
