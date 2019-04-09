FROM i386/alpine:3.9
# Maintainer
# ----------
MAINTAINER babim <babim@matmagoc.com>

RUN apk add --no-cache nano curl bash

# copyright and timezone
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/copyright.sh | bash