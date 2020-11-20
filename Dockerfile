FROM alpine:latest
LABEL maintainer="Olzzon"

RUN apk add --no-cache xvfb pulseaudio supervisor x11vnc xdg-utils wget chromium

RUN set -ex;\
 adduser -D -u 1000 chrome pulse-access;

ADD conf/ /
RUN chmod +x /*.sh
VOLUME ["/home/chrome"]

EXPOSE 5900
USER root

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
