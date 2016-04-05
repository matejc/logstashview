logstashview
============

Logstash with a simple preview in a Dockerfile,
lightweight alternative to ELK stack, it does not have many features,
but for me it is good enough

Usage
-----

Change passwords inside `logstash.conf` for logstash and for frontail in
`supervisord.conf`, search for string `amuseMeAndChangeThis` which is a default password.

Use `docker build .` and then...

Example:

Run web interface on 8881 port and logstash http input on 8882.

```
docker run -p 8881:80 -p 8882:5000 -ti 7dc09ab63f1a
```

To put/post data with curl:

```
curl -X POST --data '{"type": "app1", "message": "this is an error message"}' http://log:amuseMeAndChangeThis@localhost:8882
```

Other inputs can be specified inside `logstash.conf`:
https://www.elastic.co/guide/en/logstash/current/input-plugins.html
