FROM alpine
MAINTAINER Elliott Ye

# Update
RUN apk add --update \
        opendkim \
        opendkim-utils \
        postfix \
        supervisor \
        rsyslog \
        cyrus-sasl \
   && rm  -rf /tmp/* /var/cache/apk/*
RUN postalias /etc/postfix/aliases
ADD assets/install.sh /opt/install.sh
ADD assets/supervisord.conf /etc/supervisord.conf
RUN mkdir -p \
    /etc/supervisor/conf.d \
    /etc/postfix/sasl \
    /etc/default

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisord.conf
