FROM        ubuntu:14.04.1
MAINTAINER  Dmitry Mozzherin(dmozzherin@gmail.com)
ENV REFRESHED_AT 2014-12-25

# Update the package repository and install applications
RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
    apt-get -yqq install varnish && \
      apt-get -yqq clean

ENV VARNISH_PORT 80
ENV VARNISH_MEM  100M

# Expose port 80
EXPOSE 80
VOLUME /etc/varnish

ADD start.sh /start.sh
CMD ["/start.sh"]
