varnish
=======

Varnish to run EOL site


sudo docker run -v /eol/varnish/default.vcl:/etc/varnish/default.vcl \
  -p 80:80 eoldocker/varnish:v3.0.5
