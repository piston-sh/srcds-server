FROM sourceforts/steamcmd:debian-gdb
LABEL maintainer="admin@deniscraig.com"

ARG steam_username 
ARG steam_password

# Run Steamcmd and install dependencies
# - 244310      Source SDK Base 2013 Dedicated Server
# - 243750      Source SDK Base 2013 Multiplayer
RUN steamcmd.sh +login $steam_username $steam_password \
        +force_install_dir $STEAM_HOME_DIR \
        +app_update 244310 validate \
        +app_update 243750 validate \
        +quit

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
