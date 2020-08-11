FROM alpine
MAINTAINER Elliott Ye

# Update
RUN apk add --update \
        opendkim \
        opendkim-utils \
        postfix \
        supervisor \
        cyrus-sasl \
   && rm  -rf /tmp/* /var/cache/apk/*
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
