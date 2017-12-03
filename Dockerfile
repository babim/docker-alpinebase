FROM alpine:edge
# Maintainer
# ----------
MAINTAINER babim <babim@matmagoc.com>

RUN rm -f /etc/motd && \
    echo "---" > /etc/motd && \
    echo "Support by Duc Anh Babim. Contact: babim@matmagoc.com" >> /etc/motd && \
    echo "---" >> /etc/motd && \
    touch "/(C) Babim"

# Set timezone
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && echo "Asia/Ho_Chi_Minh" >  /etc/timezone \
    && apk del tzdata
