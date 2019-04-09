FROM alpine:3.7
# Maintainer
# ----------
MAINTAINER babim <babim@matmagoc.com>

RUN apk add --no-cache nano curl bash

# copyright and timezone
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/copyright.sh | bash
    
# add ssh
RUN apk add --no-cache openssh
# add entrypoint script
COPY docker-entrypoint.sh /runssh.sh
RUN chmod +x /runssh.sh

#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN mkdir /var/run/sshd
# allow root ssh
RUN sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
ENTRYPOINT ["/runssh.sh"]
CMD ["/usr/sbin/sshd", "-D"]
