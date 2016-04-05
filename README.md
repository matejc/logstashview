logstashview
============

Logstash with a simple preview in a Dockerfile,
lightweight alternative to ELK stack, it does not have many features,
but for me it is good enough

Usage
-----

FRONTAIL_PASSWORD environment variable is password for web interface and
HTTP_PASSWORD is password for logstash http input. Username for both is `log`.

Use `docker build .` and then...

Example:

Run web interface on 8881 port and logstash http input on 8882.

```
docker run -e FRONTAIL_PASSWORD=myFrontailPassword -e HTTP_PASSWORD=myHTTPInputPassword -p 8881:80 -p 8882:5000 -ti 7cd6db277a31
```

To put/post data with curl:

```
curl -X POST --data '{"type": "app1", "message": "this is an error message"}' http://log:myHTTPInputPassword@localhost:8882
```

Other inputs can be specified inside `logstash.conf`:
https://www.elastic.co/guide/en/logstash/current/input-plugins.html
