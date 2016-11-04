FROM        ubuntu:14.04.1
MAINTAINER  Jeremy Rice(jrice@eol.org)
ENV LAST_FULL_REBUILD 2016-01-29

# Update the package repository and install applications
RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish supervisor && \
  apt-get -yqq clean

RUN chown varnishlog:varnishlog /var/log/varnish && \
  chmod 750 /var/log/varnish

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV VARNISH_PORT 80
ENV VARNISH_MEM  100M

# Expose port 80
EXPOSE 80
VOLUME /etc/varnish

CMD /usr/bin/supervisord
