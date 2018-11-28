FROM sourceforts/steamcmd:debian
LABEL maintainer="admin@deniscraig.com"

ARG steam_username 
ARG steam_password

ENV HOSTNAME="docker-dedicated-server"
ENV SRCDS_FPSMAX=300
ENV SRCDS_TICKRATE=128
ENV SRCDS_PORT=27015
ENV SRCDS_TV_PORT=27020
ENV SRCDS_MAXPLAYERS=20
ENV SRCDS_RCONPW="changeme" 
ENV SRCDS_PW="changeme"

ENV SRCDS_AUTOUPDATE=$SOURCE_HOME_DIR/autoupdate.txt
COPY --chown=steam:steam autoupdate.txt $SRCDS_AUTOUPDATE

# Expose ports
EXPOSE 27005/udp
EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27020/udp
EXPOSE 26900/udp
EXPOSE 51840/udp

WORKDIR $STEAM_HOME_DIR
