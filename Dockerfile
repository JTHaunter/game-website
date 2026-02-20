FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    chromium-browser \
    novnc websockify \
    x11vnc xvfb \
    supervisor \
    && apt-get clean

RUN mkdir -p /home/vnc

COPY startup.sh /home/vnc/startup.sh
RUN chmod +x /home/vnc/startup.sh

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
