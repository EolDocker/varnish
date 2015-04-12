#!/bin/bash

# Start varnish and log
varnishd -f /etc/varnish/default.vcl -T 0.0.0.0:6082 -S /etc/varnish/secret -s malloc,${VARNISH_MEM} -a 0.0.0.0:${VARNISH_PORT}
varnishlog
