FROM        ubuntu:14.04.1
MAINTAINER  Dmitry Mozzherin(dmozzherin@gmail.com)
ENV LAST_FULL_REBUILD 2015-03-05

# Update the package repository and install applications
RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish && \
  apt-get -yqq clean

RUN chown varnishlog:varnishlog /var/log/varnish &&
  chmod 750 /var/log/varnish

ENV VARNISH_PORT 80
ENV VARNISH_MEM  100M

# Expose port 80
EXPOSE 80
VOLUME /etc/varnish

COPY start.sh /start.sh
CMD ["/start.sh"]
