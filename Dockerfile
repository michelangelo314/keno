ARG base_image_version=0.9.22
FROM phusion/baseimage:$base_image_version

LABEL TurtleCoin on docker \
      turtle.power=true \
      eat.pizza=true \
      turtlecoin.discord=http://discord.turtlecoin.lol

# Set debconf to run non-interactively
ENV DEBIAN_FRONTEND noninteractive
ENV SYSTEM_PACKAGES="apt-transport-https ca-certificates libssl-dev"
ENV UTIL_PACKAGES="curl unzip"

# turtlecoind remote RPC port
EXPOSE 11898

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install prereqs and setup apt (http://dockerfile.github.io/#/ubuntu)
RUN \
  apt-get update && \
  apt-get install -y $SYSTEM_PACKAGES && \
  apt-get install -y $UTIL_PACKAGES && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy user entrypoint file https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
RUN mkdir -p /turtlecoin
COPY src/install_turtlecoin.sh /turtlecoin/
WORKDIR /turtlecoin

ARG TURTLECOIN_DIST_VERSION=0.2.2
ENV TURTLECOIN_DIST_VERSION=${TURTLECOIN_DIST_VERSION}

RUN ./install_turtlecoin.sh

RUN mkdir /etc/service/TurtleCoind
COPY src/TurtleCoind /etc/service/TurtleCoind/run
RUN chmod +x /etc/service/TurtleCoind/run

RUN useradd -r -M turtle


